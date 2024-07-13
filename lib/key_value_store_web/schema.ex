defmodule KeyValueStoreWeb.Schema do
  use Absinthe.Schema

  alias KeyValueStoreWeb.Resolvers.KeyValueResolver

  query do
    @desc "get a value by key"
    field :get, :string do
      arg(:key, non_null(:string))
      resolve(&KeyValueResolver.get/3)
    end
  end

  mutation do
    @desc "set a value by a key"
    field :set, :boolean do
      arg(:key, non_null(:string))
      arg(:value, non_null(:string))
      resolve(&KeyValueResolver.set/3)
    end
  end
end
