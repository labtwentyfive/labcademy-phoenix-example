# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

config :labcademy, Labcademy.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "labcademy_repo",
  username: "ms2",
  password: "",
  hostname: "localhost"

config :labcademy,
  ecto_repos: [Labcademy.Repo]

# Configures the endpoint
config :labcademy, LabcademyWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "dBS/GyzdaraJGGtBLPEcuIW0KxViIECwDY0yL525yCRFGbXc1kVSJ7nJEnzDOxWU",
  render_errors: [view: LabcademyWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Labcademy.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
