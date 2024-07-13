# KeyValueStore

## Overview
This project is an Elixir application that functions as a key/value store with Redis integration and a GraphQL API.

## Design Decisions
### Architectural Design
- **GenServer:** Used for managing Redis interactions due to its simplicity and reliability.
- **Redix:** Chosen for interacting with Redis because of its lightweight and efficient nature.
- **Absinthe:** Used for GraphQL API implementation due to its robust tooling and seamless integration with Phoenix.

### Redis Integration
- **Synchronous Operations:** `handle_call` is used for `get` and `set` operations to ensure synchronous execution and immediate feedback.

### GraphQL API
- **Queries and Mutations:** Basic queries and mutations are designed for setting and getting values from Redis.

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
