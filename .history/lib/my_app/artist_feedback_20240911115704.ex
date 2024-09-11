
defmodule MusicDB.ArtistFeedback do
  use Ecto.Schema
  import Ecto.Changeset
  alias MusicDB.{A}

  schema "artist_feedback" do

    field(:type)
    field(:detailedfeedback)
    timestamps()

    belongs_to(:artist, Artist)
  end
  def changeset(album_genre, params) do
    album_genre
    |> cast(params, [:type,:detailedfeedback])
    |> validate_required([:type,:detailedfeedback])
    |> unique_constraint(:id)

  end
end
