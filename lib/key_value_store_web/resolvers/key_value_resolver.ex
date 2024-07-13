defmodule KeyValueStoreWeb.Resolvers.KeyValueResolver do
  alias KeyValueStore.Redis

  def set(_, %{key: key, value: value}, _) do
    case Redis.set(key, value) do
      {:ok, _} -> {:ok, true}
      {:error, reason} -> {:error, reason}
    end
  end

  def get(_, %{key: key}, _) do
    case Redis.get(key) do
      {:ok, value} -> {:ok, value}
      {:error, reason} -> {:error, reason}
    end
  end
end
