defmodule MyApp.Repo do

  use Ecto.Repo,
    otp_app: :my_app,
    adapter: Ecto.Adapters.Postgres
    def using_postgres? do
      __MODULE__.config()[:adapter] == Ecto.Adapters.Postgres
    end
end
