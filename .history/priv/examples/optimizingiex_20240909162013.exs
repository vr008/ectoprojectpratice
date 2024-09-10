import Ecto.Query
import Ecto.Changeset
alias MusicDB.{
  Repo,
  Artist,
  Album,
  Track,
  Genre,
  Log
  }

album = Repo.get(Album, 1) |> Repo.preload(:tracks)


defmodule H do
  def update(schema, changes) do
  schema
  |> Ecto.Changeset.change(changes)
  |> Repo.update
end
end

artist = Repo.get_by(Artist, name: "Miles Davis")
H.update(artist, name: "Miles Dewey Davis III",birth_date: ~D[1926-05-26])
