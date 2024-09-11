defmodule MusicDB.ArtistFeedbackTest do
  use ExUnit.Case, async: true
  alias MusicDB.ArtistFeedback

  test "changeset/2 requires type and detailedfeedback" do
    params = %{}

    changeset = ArtistFeedback.changeset(%ArtistFeedback{}, params)

    refute changeset.valid?
    assert changeset.errors[:type] == {"can't be blank", [validation: :required]}
    assert changeset.errors[:detailedfeedback] == ["can't be blank"]
  end

  test "changeset/2 accepts valid params" do
    params = %{
      type: "positive",
      detailedfeedback: "Great performance!"
    }

    changeset = ArtistFeedback.changeset(%ArtistFeedback{}, params)

    assert changeset.valid?
    assert changeset.changes[:type] == "positive"
    assert changeset.changes[:detailedfeedback] == "Great performance!"
  end

  test "changeset/2 enforces unique constraint on id" do

    params1 = %{
      type: "positive",
      detailedfeedback: "Great performance!"
    }

    changeset1 = ArtistFeedback.changeset(%ArtistFeedback{}, params1)
    {:ok, artist_feedback1} = Ecto.Changeset.apply_changes(changeset1)

    params2 = %{
      type: "negative",
      detailedfeedback: "Not so good."
    }

    changeset2 = ArtistFeedback.changeset(artist_feedback1, params2)

    refute changeset2.valid?
    assert changeset2.errors[:id] == ["has already been taken"]
  end
end
