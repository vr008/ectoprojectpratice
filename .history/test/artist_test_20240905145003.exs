defmodule Artis do
  @valid_params %{title: "Test Album"}
  @invalid_params %{title: nil}

  describe "Album schema and changeset tests" do
    test "requires data" do
      changeset = Album.changeset(%Album{}, %{})
      assert Changeset.invalid?(changeset)
      assert Changeset.get_field_error(changeset, :title) == ["can't be blank"]
    end

    test "accepts valid params" do
      params = %{title: "Greatest Hits"}
      changeset = Album.changeset(%Album{}, params)
      assert Changeset.valid?(changeset)
    end
end
end
