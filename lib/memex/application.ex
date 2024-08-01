defmodule Memex.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      MemexWeb.Telemetry,
      Memex.Repo,
      {DNSCluster, query: Application.get_env(:memex, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Memex.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Memex.Finch},
      # Start a worker by calling: Memex.Worker.start_link(arg)
      # {Memex.Worker, arg},
      # Start to serve requests, typically the last entry
      MemexWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Memex.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MemexWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
