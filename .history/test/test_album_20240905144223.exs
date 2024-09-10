defmodule Test.Album do
  @valid_params %{title: "Test Album"}
  @invalid_params %{title: nil}
  describe "schema" do
    test "defines required fields" do
      fields = Album.__schema__(:fields)

      assert fields[:title]
      assert fields[:inserted_at]
      assert fields[:updated_at]
    end

    test "defines associations" do
      associations = Album.__schema__(:associations)

      assert associations[:artist]
      assert associations[:tracks]
      assert associations[:album]
      assert associations[:sold_unit]
      assert associations[:genres]
    end
  end

  describe "Album schema and changeset tests" do
    test "requires title" do
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
