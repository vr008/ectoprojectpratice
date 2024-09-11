defmodule MusicDB.ArtistFeedbackTest do
  use ExUnit.Case, async: true
  alias MusicDB.ArtistFeedback

  test "changeset/2 requires type and detailedfeedback" do
    params = %{}

    changeset = ArtistFeedback.changeset(%ArtistFeedback{}, params)

    refute changeset.valid?
    assert changeset.errors[:type] == {"can't be blank", [validation: :required]}
    assert changeset.errors[:detailedfeedback] == {"can't be blank", [validation: :required]}
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


  end
end
