
defmodule MusicDB.Rating do
  use Ecto.Schema
  import Ecto.Changeset
  alias MusicDB.Track

  schema "track_feedbacks" do
    field(:type)
    field(:detailedfeedback)

    timestamps()

    belongs_to(:track, Artist)
  end
  def changeset(album_genre, params) do
    album_genre
    |> cast(params, [:ratin])
    |> validate_required([:rating])
  end
end
