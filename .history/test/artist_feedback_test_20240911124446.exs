defmodule MusicDB.ArtistFeedbackTest do
  use ExUnit.Case, async: true
  alias MusicDB.ArtistFeedback

  test "changeset/2 requires type and detailedfeedback" do
    params = %{}

    changeset = ArtistFeedback.changeset(%ArtistFeedback{}, params)

    refute changeset.valid?
    assert changeset.errors[:type] == ["can't be blank"]
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
    # Assuming you have a unique constraint on the `id` field in the database
    # You need to insert a record with a specific `id` and then try to insert another record with the same `id`

    # Insert the first record
    params1 = %{
      type: "positive",
      detailedfeedback: "Great performance!"
    }

    changeset1 = ArtistFeedback.changeset(%ArtistFeedback{}, params1)
    {:ok, artist_feedback1} = Ecto.Changeset.apply_changes(changeset1)

    # Try to insert another record with the same `id`
    params2 = %{
      type: "negative",
      detailedfeedback: "Not so good."
    }

    changeset2 = ArtistFeedback.changeset(artist_feedback1, params2)

    refute changeset2.valid?
    assert changeset2.errors[:id] == ["has already been taken"]
  end
end
