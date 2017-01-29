# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :srob_phoenix,
  ecto_repos: [SrobPhoenix.Repo]

# Configures the endpoint
config :srob_phoenix, SrobPhoenix.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "6tAzqXiafWe+am8IrUKf1hn4D1uonSpmjo5/xeo+YJdfWM48MLMAHaypbOtj8ap4",
  render_errors: [view: SrobPhoenix.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SrobPhoenix.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :ueberauth, Ueberauth,
  providers: [
    identity: {Ueberauth.Strategy.Identity, [
      callback_methods: ["POST"],
      request_path: "/auth/login",
      callback_path: "/auth/login/callback"
    ]},
    facebook: {Ueberauth.Strategy.Facebook, []}
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
