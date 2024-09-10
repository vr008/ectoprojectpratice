defmodule Test.Album do
  @valid_params %{title: "Test Album"}
  @invalid_params %{title: nil}
  use ExUnit.Case, async: true
  alias MusicDB.{Album, Repo}
  alias Ecto.Changeset


  describe "Album schema and changeset tests" do
    test "requires title" do
      changeset = Album.changeset(%Album{}, %{})
      assert Changeset.invalid?(changeset)
      assert Changeset.get_field_error(changeset, :name) == ["can't be blank"]
    end

    test "accepts valid params" do
      params = %{title: "Greatest Hits"}
      changeset = Album.changeset(%Album{}, params)
      assert Changeset.valid?(changeset)
    end
end
end
