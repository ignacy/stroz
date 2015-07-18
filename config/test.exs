use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :stroz, Stroz.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :stroz, Stroz.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "stroz",
  password: "stroz",
  database: "stroz_test",
  hostname: "localhost",
  port: 5432,
  pool: Ecto.Adapters.SQL.Sandbox, # Use a sandbox for transactional testing
  size: 1
