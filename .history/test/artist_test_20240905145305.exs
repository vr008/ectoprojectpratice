defmodule Test.Album do
  @valid_params %{title: "Test Album"}
  @invalid_params %{title: nil}
  use ExUnit.Case, async: true
  alias MusicDB.{Album, Repo}
  alias Ecto.Changeset


  describe "Album schema and changeset tests" do
    test "requires title" do
      changeset = A.changeset(%Album{}, %{})
      assert Changeset.invalid?(changeset)
      assert Changeset.get_field_error(changeset, :name,:birth_date,:death_date) == ["can't be blank"]
    end

    test "accepts valid params" do
      params = %{title: "john", birth_date: "2024-08-10",death_date: "2040-09-12"}
      changeset = Album.changeset(%Album{}, params)
      assert Changeset.valid?(changeset)
    end
end
end
