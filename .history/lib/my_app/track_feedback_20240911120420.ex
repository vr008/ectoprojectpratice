
defmodule MusicDB.Track_Feedback do
  use Ecto.Schema
  import Ecto.Changeset
  alias MusicDB.Track

  schema "trackfeedbacks" do
    field(:type)
    field(:detailedfeedback)

    timestamps()

    belongs_to(:tracks, Track)
  end
  def changeset(album_genre, params) do
    album_genre
    |> cast(params, [:type,:detailedfeedback])
    |> validate_required([:type,:detailedfeedback])
    |>unique_constraint(:id)
  end
end
