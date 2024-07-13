defmodule KeyValueStoreWeb.RedisTest do
  use ExUnit.Case
  alias KeyValueStore.Redis

  test "set and get key/value" do
    assert {:ok, true} == Redis.set("test_key", "test_value")
    assert {:ok, "test_value"} == Redis.get("test_key")
  end
end
