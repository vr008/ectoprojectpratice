defmodule MusicDB.RatingTest do
  use ExUnit.Case, async: true
  alias MusicDB.{Rating, Artist}

  describe "changeset/2" do
    test "requires rating and artist_id" do
      changeset = Rating.changeset(%Rating{}, %{})
      refute changeset.valid?
      assert changeset.errors[:rating] == ["can't be blank"]
      assert changeset.errors[:artist_id] == ["can't be blank"]
    end

    test "accepts valid params" do
      artist = %Artist{id: 1} # Assuming an artist with id 1 exists
      params = %{rating: 5, artist_id: artist.id}
      changeset = Rating.changeset(%Rating{}, params)
      assert changeset.valid?
    end
  end
end
