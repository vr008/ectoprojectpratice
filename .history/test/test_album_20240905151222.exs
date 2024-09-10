#defmodule Test.Album do

  use ExUnit.Case, async: true
  alias MusicDB.{Album}
  alias Ecto.Changeset


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
