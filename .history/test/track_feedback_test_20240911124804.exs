defmodule MusicDB.TrackFeedbackTest do
  use ExUnit.Case, async: true
  alias MusicDB.TrackFeedback

  test "changeset/2 requires type and detailedfeedback" do
    params = %{}

    changeset = TrackFeedback.changeset(%TrackFeedback{}, params)

    refute changeset.valid?
    assert changeset.errors[:type] == ["can't be blank"]
    assert changeset.errors[:detailedfeedback] == ["can't be blank"]
  end

  test "changeset/2 accepts valid params" do
    params = %{
      type: "positive",
      detailedfeedback: "Great performance!"
    }

    changeset = TrackFeedback.changeset(%TrackFeedback{}, params)

    assert changeset.valid?
    assert changeset.changes[:type] == "positive"
    assert changeset.changes[:detailedfeedback] == "Great performance!"
  end


end
