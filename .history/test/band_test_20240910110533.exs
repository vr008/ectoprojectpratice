defmodule MusicDB.BandTest do
  use ExUnit.Case, async: true
  alias MusicDB.Band

  describe "changeset/2" do
    test "requires name and year_started" do
      changeset = Band.changeset(%Band{}, %{})
      refute changeset.valid?
      assert changeset.errors[:name] == ["can't be blank"]
      assert changeset.errors[:year_started] == ["can't be blank"]
    end

    test "accepts valid params" do
      params = %{
        name: "Test Band",
        year_started: 1990,
        year_ended: 2020
      }
      changeset = Band.changeset(%Band{}, params)
      assert changeset.valid?
    end

    test "validates year order" do
      params = %{
        name: "Test Band",
        year_started: 2020,
        year_ended: 1990
      }
      changeset = Band.changeset(%Band{}, params)
      refute changeset.valid?
      changeset.errors[:year_ended] == ["must be after year_started"]
    end
  end

  describe "to_artist/1" do
    test "converts Band to Artist" do
      band = %Band{
        name: "Test Band",
        year_started: 1990,
        year_ended: 2020
      }
      artist = Band.to_artist(band)
      assert artist[:name] == "Test Band"
      assert artist[:birth_date] == ~D[1990-01-01]
      assert artist[:death_date] == ~D[2020-12-31]
    end
  end
end
