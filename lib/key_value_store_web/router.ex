defmodule KeyValueStoreWeb.Router do
  use KeyValueStoreWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/graphql", Absinthe.Plug, schema: KeyValueStoreWeb.Schema

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: KeyValueStoreWeb.Schema,
      interface: :simple
  end
end
