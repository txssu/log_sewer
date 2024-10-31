defmodule LogSewer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl Application
  def start(_type, _args) do
    children = [
      LogSewerWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:log_sewer, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: LogSewer.PubSub},
      # Start a worker by calling: LogSewer.Worker.start_link(arg)
      # {LogSewer.Worker, arg},
      # Start to serve requests, typically the last entry
      LogSewerWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LogSewer.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl Application
  def config_change(changed, _new, removed) do
    LogSewerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
