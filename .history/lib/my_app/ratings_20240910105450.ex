defmodule MusicDB.Rating do
  use Ecto.Schema
  alias MusicDB.Artist

  schema "ratings" do

    field(:rating, :integer)
    timestamps()

    belongs_to(:artist, Artist)
  end
  def changeset(album_genre, params) do
    album_genre
    |> cast(params, [:albums_id, :genres_id])
    |> validate_required([:albums_id, :genres_id])
  end
end
