# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :getaways,
  ecto_repos: [Getaways.Repo]

# Configures the endpoint
config :getaways, GetawaysWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "QvIvwiEVs96ix7OfSIzZidy9eE6aWOkb53+k9Vgcs3hDHkJAFRTzIwOYnbvbVMer",
  render_errors: [view: GetawaysWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Getaways.PubSub,
  live_view: [signing_salt: "SPHCDAwI"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
