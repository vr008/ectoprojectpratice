
defmodule MusicDB.Rating do
  use Ecto.Schema
  import Ecto.Changeset
  alias MusicDB.Artist

  schema "artist_feedback" do

    field(:type)
    field:detailedfeedback, :string,null: false
    timestamps()

    belongs_to(:artist, Artist)
  end
  def changeset(album_genre, params) do
    album_genre
    |> cast(params, [:rating])
    |> validate_required([:rating])
  end
end
