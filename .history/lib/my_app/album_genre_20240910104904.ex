
defmodule MusicDB.AlbumGenre do
  use Ecto.Schema
  alias MusicDB.{Album, Genre}

  schema "albums_genres" do
    belongs_to(:albums, Album)
    belongs_to(:genres, Genre)
  end
  def changeset(album, params) do
    album
    |> cast(params, [:albums])
    |> validate_required([:t])

  end

end
