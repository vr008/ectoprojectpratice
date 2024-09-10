defmodule MyApp.Application do

  use Application

  @impl true
  def start(_type, _args) do
    children = [

      MusicDB.Repo
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MyApp.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
