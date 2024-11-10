defmodule Coinbase.Client do
    use WebSockex

  @binance_base_url "wss://stream.binance.com:9443/ws"

  def start_link(symbol) do
    url = "#{@binance_base_url}/#{symbol}@ticker"
    WebSockex.start_link(url, __MODULE__, %{}, name: __MODULE__)
  end

  def handle_connect(_conn, state) do
    IO.puts("Connected to Binance WebSocket API")
    {:ok, state}
  end

  def handle_disconnect(_reason, state) do
    IO.puts("Disconnected from Binance WebSocket API")
    {:ok, state}
  end

  def handle_frame({:text, msg}, state) do
    msg
    |> Jason.decode!()
    |> handle_message()

    {:ok, state}
  end

  defp handle_message(%{"c" => price}) do
    timestamp = DateTime.utc_now() |> DateTime.to_string()
    IO.puts("[#{timestamp}] New quote: $#{price}")
  end

  defp handle_message(_), do: :ok

  def handle_info(:stop, _state) do
    {:close, :normal, %{}}
  end

  def terminate(reason, _state) do
    IO.puts("Terminating due to: #{inspect(reason)}")
    :ok
  end
end
