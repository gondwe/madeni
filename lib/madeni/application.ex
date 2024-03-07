defmodule Madeni.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      MadeniWeb.Telemetry,
      Madeni.Repo,
      {DNSCluster, query: Application.get_env(:madeni, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Madeni.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Madeni.Finch},
      # Start a worker by calling: Madeni.Worker.start_link(arg)
      # {Madeni.Worker, arg},
      # Start to serve requests, typically the last entry
      MadeniWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Madeni.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MadeniWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
