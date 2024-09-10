
defmodule MusicDB.SoloArtistTest do
  use ExUnit.Case, async: true
  alias MusicDB.{SoloArtist}
  alias Ecto.Changeset

  describe "changeset/2" do
    test "requires title birth_date death_date" do
      changeset = SoloArtist.changeset(%SoloArtist{}, %{})
      refute changeset.valid?
      assert changeset.errors[:name1] == {"can't be blank", [validation: :required]}
      assert changeset.errors[:name2] == {"can't be blank", [validation: :required]}
      assert changeset.errors[:name3] == {"can't be blank", [validation: :required]}
      assert changeset.errors[:birth_date] == {"can't be blank", [validation: :required]}
      assert changeset.errors[:death_date] == {"can't be blank", [validation: :required]}

    end

    test "accepts valid params" do
      params = %{name1: "john", name2: "abraham",name3: "mukesh",birth_date: ~D[2024-09-09],death_date: ~D[2040-09-09]}
      changeset = SoloArtist.changeset(%SoloArtist{}, params)
      assert changeset.valid?
    end
      test "converts solo_artist to artist map" do
        solo_artist = %SoloArtist{
          name1: "John",
          name2: "Doe",
          name3: "Smith",
          birth_date: ~D[1980-01-01],
          death_date: ~D[2020-01-01]
        }

        expected = %{
          name: "John Doe Smith",
          birth_date: ~D[1980-01-01],
          death_date: ~D[2020-01-01]
        }

        assert SoloArtist.to_artist(solo_artist) == expected
      end

      test "handles empty name parts" do
        solo_artist = %SoloArtist{
          name1: "John",
          name2: "",
          name3: "",
          birth_date: ~D[1980-01-01],
          death_date: ~D[2020-01-01]
        }

        expected = %{
          name: "John",
          birth_date: ~D[1980-01-01],
          death_date: ~D[2020-01-01]
        }

        assert SoloArtist.to_artist(solo_artist) == expected
      end




   # test "validates birth_date day" do
   #   params = %{
   #     name: "Test Artist",
   #     birth_date: "1990-01-32", # Invalid day
   #     death_date: "2020-12-31"
   #   }
   #   changeset = SoloArtist.changeset(%SoloArtist{}, params)
   #   refute changeset.valid?
   #   assert changeset.errors[:birth_date] == {"day must be between 1 and 31",[]}
   # end
   test "validates birth_date is before death_date" do
    changeset = %Ecto.Changeset{
      valid?: true,
      changes: %{birth_date: ~D[1980-01-01], death_date: ~D[2020-01-01]}
    }

    assert SoloArtist.validate_date_order(changeset, :birth_date, :death_date).valid?
  end

  test "invalidates when birth_date is after death_date" do
    changeset = %Ecto.Changeset{
      valid?: true,
      changes: %{birth_date: ~D[2020-01-01], death_date: ~D[1980-01-01]}
    }

    SoloArtist.validate_date_order(changeset, :birth_date, :death_date).valid?
  end

  end

end
