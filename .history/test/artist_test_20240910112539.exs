
defmodule MusicDB.Artist_Test do
  use ExUnit.Case, async: true
  alias MusicDB.{Artist, Repo,SoloArtist,Genre}
  alias Ecto.Changeset

  describe "changeset/2" do
    test "requires title birth_date death_date" do
      changeset = Artist.changeset(%Artist{}, %{})
      refute changeset.valid?
      assert changeset.errors[:name] == {"can't be blank", [validation: :required]}
      assert changeset.errors[:birth_date] == {"day must be between 1 and 31", []}
      assert changeset.errors[:death_date] == {"can't be blank", [validation: :required]}

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
      test "creates changeset from SoloArtist" do
        solo_artist = %SoloArtist{
          name1: "First",
          name2: "Middle",
          name3: "Last",
          birth_date: ~D[1990-01-01],
          death_date: ~D[2020-12-31]
        }
        changeset = Artist.changeset(solo_artist)
        assert changeset.valid?
        assert changeset.data.name == "First Middle Last"
        assert changeset.data.birth_date == ~D[1990-01-01]
        assert changeset.data.death_date == ~D[2020-12-31]
      end

      test "validate_birth_date/1 adds error for invalid month" do
        params = %{
          name1: "John",
          name2: "Doe",
          name3: "Smith",
          birth_date: ~D[2000-13-01],
          death_date: ~D[2020-01-01]
        }

        changeset = SoloArtist.changeset(%SoloArtist{}, params)

        refute changeset.valid?
        assert changeset.errors[:birth_date] == ["month must be between 1 and 12"]
      end

      test "validate_birth_date/1 accepts valid month" do
        params = %{
          name1: "John",
          name2: "Doe",
          name3: "Smith",
          birth_date: ~D[2000-12-01],
          death_date: ~D[2020-01-01]
        }

        changeset = SoloArtist.changeset(%SoloArtist{}, params)

        assert changeset.valid?
      end

      test "validate_birth_day/1 adds error for invalid day" do
        params = %{
          name1: "John",
          name2: "Doe",
          name3: "Smith",
          birth_date: ~D[2000-01-32],
          death_date: ~D[2020-01-01]
        }

        changeset = SoloArtist.changeset(%SoloArtist{}, params)

        refute changeset.valid?
        assert changeset.errors[:birth_date] == ["day must be between 1 and 31"]
      end

      test "validate_birth_day/1 accepts valid day" do
        params = %{
          name1: "John",
          name2: "Doe",
          name3: "Smith",
          birth_date: ~D[2000-01-31],
          death_date: ~D[2020-01-01]
        }

        changeset = SoloArtist.changeset(%SoloArtist{}, params)

        assert changeset.valid?
      end

  end

end
