defmodule Artist_Embed_Test do
  use ExUnit.Case, async: true

  import Ecto.Changeset
  use Ecto.Schema
  alias MusicDB.AlbumWithEmbeds
  describe "changeset/2" do
    test "requires note author" do
      changeset = AlbumWithEmbeds.changeset(%AlbumWithEmbeds{}, %{})
      refute changeset.valid?
      assert changeset.errors[:name] == {"can't be blank", [validation: :required]}

    end

    test "accepts valid params" do
      params = %{name: "john"}
      changeset = AlbumWithEmbeds.changeset(%AlbumWithEmbeds{}, params)
      assert changeset.valid?
    end
  end
end
