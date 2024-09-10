
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
      params = %{name: "john", birth_date: ~D[2024-08-08],death_date: ~D2040-09-09"}
      changeset = Artist.changeset(%Artist{}, params)
      assert changeset.valid?
    end
  end
end
