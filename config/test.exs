use Mix.Config

# Configure your database
config :demo_wallaby_liveview, DemoWallabyLiveview.Repo,
  username: "postgres",
  password: "postgres",
  database: "demo_wallaby_liveview_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :demo_wallaby_liveview, DemoWallabyLiveviewWeb.Endpoint,
  http: [port: 4002],
  server: true

config :demo_wallaby_liveview, :sql_sandbox, true

# Print only warnings and errors during test
config :logger, level: :warn

config :wallaby, driver: Wallaby.Experimental.Chrome
