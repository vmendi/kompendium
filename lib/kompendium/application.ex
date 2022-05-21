defmodule Kompendium.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Kompendium.Repo,
      # Start the Telemetry supervisor
      KompendiumWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Kompendium.PubSub},
      # Start the Endpoint (http/https)
      KompendiumWeb.Endpoint
      # Start a worker by calling: Kompendium.Worker.start_link(arg)
      # {Kompendium.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Kompendium.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    KompendiumWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
