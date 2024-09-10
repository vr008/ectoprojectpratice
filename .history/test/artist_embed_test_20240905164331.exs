defmodule Artist_Embed_Test do
  import Ecto.Changeset
  use Ecto.Schema
  alias MusicDB.AlbumWithEmbeds
  describe "changeset/2" do
    test "requires note author" do
      changeset = AlbumWithEmbeds.changeset(%AlbumWithEmbeds{}, %{})
      refute changeset.valid?
      assert changeset.errors[:note] == {"can't be blank", [validation: :required]}
      assert changeset.errors[:author] == {"can't be blank", [validation: :required]}

    end

    test "accepts valid params" do
      params = %{note: "john", author: "helll"}
      changeset = AlbumWithEmbeds.changeset(%AL{}, params)
      assert changeset.valid?
    end
  end
end
