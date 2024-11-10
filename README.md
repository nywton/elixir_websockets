# Coinbase

## How to Use Binance WebSocket Client

### Prerequisites
Ensure you have Elixir installed and the following dependencies added to your `mix.exs` file:
```elixir
defp deps do
  [
    {:websockex, "~> 0.4.3"},
    {:jason, "~> 1.4"}
  ]
end
```
Run `mix deps.get` to install them.

### Running the Client
1. Open your terminal and navigate to the project directory.
2. Start an `iex` session with:
   ```bash
   iex -S mix
   ```
3. Start the WebSocket client by running:
   ```elixir
   BinanceWebSocketClient.start_link("btcusdt")
   ```
   Replace `"btcusdt"` with any trading pair you want to monitor (e.g., `"ethusdt"`).

### Viewing Real-Time Quotes
Once connected, you will see output similar to this whenever a new quote is received:
```
Connected to Binance WebSocket API
[2024-11-10 12:34:56Z] New quote: $12345.67
[2024-11-10 12:35:01Z] New quote: $12348.90
```

### Stopping the Client
To stop the WebSocket client, use `Ctrl+C` twice or send a stop message from `iex` with:
```elixir
send(BinanceWebSocketClient, :stop)
```
```

This includes all the necessary information and instructions for running the client.
