defmodule MusicDB.Repo do

  use Ecto.Repo,
    otp_app: :my_db,
    adapter: Ecto.Adapters.Postgres
end
