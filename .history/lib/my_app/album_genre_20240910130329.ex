#import ExUnit.Assertions
import Ecto.Changeset
#import Ecto.Query
defmodule MusicDB.AlbumGenre do
  use Ecto.Schema
  alias MusicDB.{Album, Genre}

  schema "albums_genres" do
    belongs_to(:albums, Album)
    belongs_to(:genres, Genre)
  end

  def changeset(album_genre, params) do
    album_genre
    |> cast(params, [:albums_id, :agenres_id])
    |> validate_required([:albums_id, :genres_id])
  end
end
