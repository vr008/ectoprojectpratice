
defmodule MusicDB.Rating do
  use Ecto.Schema
  import Ecto.Changeset
  alias MusicDB.Artist

  schema "track_feedbacks" do
    field(:type)
    field(:detailedfeedback)

    timestamps()

    belongs_to(:artist, Artist)
  end
  def changeset(album_genre, params) do
    album_genre
    |> cast(params, [:ratin])
    |> validate_required([:rating])
  end
end
