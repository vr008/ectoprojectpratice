
import ExUnit.Assertions

alias MusicDB.Repo

Repo.aggregate("albums", :count, :id)

assert 5 = Repo.aggregate("albums", :count, :id)

defmodule MusicDB.Repo do
  use Ecto.Repo,
    otp_app: :music_db,
    adapter: Ecto.Adapters.Postgres

  def count(table) do
    aggregate(table, :count, :id)
  end

end

Repo.count("albums")
#=> 5

assert 5 = Repo.count("albums")

defmodule DummyModule do

  def init(_, opts) do
    {:ok, Keyword.put(opts, :url, System.get_env("DATABASE_URL"))}
  end

end
