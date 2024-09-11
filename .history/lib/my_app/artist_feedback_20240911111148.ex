
defmodule MusicDB.Artist_Feedback do
  use Ecto.Schema
  import Ecto.Changeset
  alias MusicDB.Artist

  schema "artist_feedback" do

    field(:type)
    field(:detailedfeedback)
    timestamps()

    belongs_to(:artist, Artist)
  end
  def changeset(album_genre, params) do
    album_genre
    |> cast(params, [:type,])
    |> validate_required([:rating])
    |> unique_constraint(:id)

  end
end
