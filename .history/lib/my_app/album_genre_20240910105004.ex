
defmodule MusicDB.AlbumGenre do
  use Ecto.Schema
  alias MusicDB.{Album, Genre}

  schema "albums_genres" do
    belongs_to(:albums, Album)
    belongs_to(:genres, Genre)
  end

  def changeset(album_genre, params) do
    album_genre
    |> cast(params, [:album_id, :genre_id])
    |> validate_required([:album_id, :genre_id])
  end
end
