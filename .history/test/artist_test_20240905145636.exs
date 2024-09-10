defmodule Artist.Test do
  @valid_params %{title: "Test Album"}
  @invalid_params %{title: nil}
  use ExUnit.Case, async: true
  alias MusicDB.{Artist, Repo,Album}
  alias Ecto.Changeset


  describe "Alrtist schema and changeset tests" do
    test "requires title" do
      changeset = Artist.changeset(%Artist{}, %{})
      assert Changeset.invalid?(changeset)
      assert Changeset.get_field_error(changeset, :name,:birth_date,:death_date) == ["can't be blank"]
    end

    test "accepts valid params" do
      params = %{title: "john", birth_date: "2024-08-08",death_date: "2040-09-09"}
      changeset = Artist.changeset(%Artist{}, params)
      assert Changeset.valid?(changeset)
    end
end
end
