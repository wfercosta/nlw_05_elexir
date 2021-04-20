defmodule Nlw05Elexir.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Nlw05Elexir.Repo,
      # Start the Telemetry supervisor
      Nlw05ElexirWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Nlw05Elexir.PubSub},
      # Start the Endpoint (http/https)
      Nlw05ElexirWeb.Endpoint
      # Start a worker by calling: Nlw05Elexir.Worker.start_link(arg)
      # {Nlw05Elexir.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Nlw05Elexir.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    Nlw05ElexirWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
