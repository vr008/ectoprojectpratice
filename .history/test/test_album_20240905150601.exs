defmodule Test.Album do

  use ExUnit.Case
  alias MusicDB.Album

  @valid_params %{title: "Test Album"}
  @invalid_params %{title: nil}

  describe "Album changeset tests" do
    test "changeset with valid params" do
      changeset = Album.changeset(%Album{}, @valid_params)

      # Assert that the changeset is valid
      assert changeset.valid?

      # Check that the title is correctly set
      assert get_field(changeset, :title) == "Test Album"
    end

    test "changeset with invalid params (missing title)" do
      changeset = Album.changeset(%Album{}, @invalid_params)

      # Assert that the changeset is invalid
      refute changeset.valid?

      # Assert that the title field has an error
      assert {:title, {"can't be blank", _}} in errors_on(changeset)
    end
  end

end
end
