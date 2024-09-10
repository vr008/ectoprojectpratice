alias MusicDB.{
  Repo,
  Artist,
  Album,
  Track,
  Genre,
  Log
  }

album = Repo.get(Album, 1) |> Repo.preload(:tracks)
import_if_available Ecto.Query
import_if_available Ecto.Query, only: [from: 2]
import_if_available Ecto.Changeset

defmodule H do
  def update(schema, changes) do
  schema
  |> Ecto.Changeset.change(changes)
  |> Repo.update
  end

  
  end
