
defmodule MusicDB.Artist_Test do
  use ExUnit.Case, async: true
  alias MusicDB.{Artist, Repo}
  alias Ecto.Changeset

  describe "changeset/2" do
    test "requires title" do
      changeset = Artist.changeset(%Aritst{}, %{})
      refute changeset.valid?
      assert changeset.errors[:title] == {"can't be blank", [validation: :required]}
      assert changeset.errors[:birth_date] == {"can't be blank", [validation: :required]}
      assert changeset.errors[:death_date] == {"can't be blank", [validation: :required]}

    end

    test "accepts valid params" do
      params = %{title: "john", birth_date: "2024-08-08",death_date: "2040-09-09"}
      changeset = Artist.changeset(%Album{}, params)
      assert changeset.valid?
    end
  end
end
