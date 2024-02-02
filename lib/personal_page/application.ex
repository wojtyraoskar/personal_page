defmodule PersonalPage.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      PersonalPageWeb.Telemetry,
      # Start the Ecto repository
      PersonalPage.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: PersonalPage.PubSub},
      # Start Finch
      {Finch, name: PersonalPage.Finch},
      # Start the Endpoint (http/https)
      PersonalPageWeb.Endpoint
      # Start a worker by calling: PersonalPage.Worker.start_link(arg)
      # {PersonalPage.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PersonalPage.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PersonalPageWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
