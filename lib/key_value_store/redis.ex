defmodule KeyValueStore.Redis do
  use GenServer
  alias Redix

  def start_link(_) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_) do
    {:ok, conn} = Redix.start_link()
    {:ok, conn}
  end

  def set(key, value) do
    GenServer.cast(__MODULE__, {:set, key, value})
    {:ok, true}
  end

  def get(key) do
    {:ok, GenServer.call(__MODULE__, {:get, key})}
  end

  # handler

  def handle_cast({:set, key, value}, conn) do
    {:ok, _} = Redix.command(conn, ["SET", key, value])
    {:noreply, conn}
  end

  def handle_call({:get, key}, _, conn) do
    {:ok, value} = Redix.command(conn, ["GET", key])
    {:reply, value, conn}
  end
end
