defmodule KeyValueStoreWeb.SchemaTest do
  use KeyValueStoreWeb.ConnCase

  @moduletag :graphql

  test "set key/value", %{conn: conn} do
    conn =
      post conn, "/graphql", %{
        query: "mutation { set(key: \"test_key\", value: \"new_value\") }"
      }

    assert %{"data" => %{"set" => true}} == json_response(conn, 200)
  end

  test "get key/value", %{conn: conn} do
    conn = post conn, "/graphql", %{query: "{ get(key: \"test_key\") }"}
    assert %{"data" => %{"get" => "test_value"}} == json_response(conn, 200)
  end
end
