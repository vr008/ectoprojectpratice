
defmodule MusicDB.AlbumGenre do
  use Ecto.Schema
  alias MusicDB.{Album, Genre}

  schema "albums_genres" do
    belongs_to(:albums, Album)
    belongs_to(:genres, Genre)
  end
  def changeset(album, params) do
    album
    |> cast(params, [:albums,:genres])
    |> validate_required([:albums])
    |> foreign_key_constraint(:albums, name: "album_artist_id_fkey")

  end
end
