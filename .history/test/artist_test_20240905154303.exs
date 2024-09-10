
defmodule MusicDB.Artist_Test do
  use ExUnit.Case, async: true
  alias MusicDB.{Artist, Repo}
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
    test "validates birth_date month" do
      params = %{
        name: "Test Artist",
        birth_date: ~D[1990-13-01], # Invalid month
        death_date: ~D[2020-12-31]
      }
      changeset = Artist.changeset(%Artist{}, params)
      refute changeset.valid?
      assert changeset.errors[:birth_date] == ["month must be between 1 and 12"]
    end

    test "validates birth_date day" do
      params = %{
        name: "Test Artist",
        birth_date: ~D[1990-01-32], # Invalid day
        death_date: ~D[2020-12-31]
      }
      changeset = Artist.changeset(%Artist{}, params)
      refute changeset.valid?
      assert changeset.errors[:birth_date] == ["day must be between 1 and 31"]
    end
  
  end

end
