defmodule Test.Album do
  @valid_params %{title: "Test Album"}
  @invalid_params %{title: nil}
  describe "Album schema and changeset tests" do
    test "changeset with valid params" do
      changeset = Album.changeset(%Album{}, @valid_params)

      # The changeset should be valid
      assert changeset.valid?

      # It should have the correct title
      assert get_field(changeset, :title) == "Test Album"
    end

    test "changeset with invalid params (missing title)" do
      changeset = Album.changeset(%Album{}, @invalid_params)

      # The changeset should be invalid
      refute changeset.valid?

      # It should contain an error on the title field
      assert {:title, {"can't be blank", _}} in errors_on(changeset)
    end
end
