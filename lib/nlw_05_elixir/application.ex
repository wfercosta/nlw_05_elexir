defmodule Nlw05Elixir.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Nlw05Elixir.Repo,
      # Start the Telemetry supervisor
      Nlw05ElixirWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Nlw05Elixir.PubSub},
      # Start the Endpoint (http/https)
      Nlw05ElixirWeb.Endpoint
      # Start a worker by calling: Nlw05Elixir.Worker.start_link(arg)
      # {Nlw05Elixir.Worker, arg}
      # Nlw05Elixir.Supplies.ExpirationNotification
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Nlw05Elixir.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    Nlw05ElixirWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
