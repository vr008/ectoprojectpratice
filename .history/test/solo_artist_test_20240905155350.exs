
defmodule MusicDB.SoloArtistTest do
  use ExUnit.Case, async: true
  alias MusicDB.{SoloArtist}
  alias Ecto.Changeset

  describe "changeset/2" do
    test "requires title birth_date death_date" do
      changeset = Artist.changeset(%Artist{}, %{})
      refute changeset.valid?
      assert changeset.errors[:name1] == {"can't be blank", [validation: :required]}
      assert changeset.errors[:name2] == {"can't be blank", [validation: :required]}
      assert changeset.errors[:name2] == {"can't be blank", [validation: :required]}



    end

    test "accepts valid params" do
      params = %{name: "john", birth_date: ~D[2024-08-08],death_date: ~D[2040-09-09]}
      changeset = Artist.changeset(%Artist{}, params)
      assert changeset.valid?
    end


    test "validates birth_date day" do
      params = %{
        name: "Test Artist",
        birth_date: "1990-01-32", # Invalid day
        death_date: "2020-12-31"
      }
      changeset = Artist.changeset(%Artist{}, params)
      refute changeset.valid?
      assert changeset.errors[:birth_date] == {"day must be between 1 and 31",[]}
    end

  end

end
