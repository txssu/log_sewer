# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

# Configures the endpoint
config :log_sewer, LogSewerWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [json: LogSewerWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: LogSewer.PubSub,
  live_view: [signing_salt: "cSUHrK8e"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom

# Use Jason for JSON parsing in Phoenix
# of this file so it overrides the configuration defined above.
config :phoenix, :json_library, Jason

import_config "#{config_env()}.exs"
