defmodule Track_Embed_Test do
  defmodule Artist_EmbedTest do
    use ExUnit.Case, async: true
    import Ecto.Changeset
    use Ecto.Schema
    alias MusicDB.AlbumWithEmbeds
    describe "changeset/2" do
      test "requires note author" do
        changeset = AlbumWithEmbeds.changeset(%AlbumWithEmbeds{}, %{})
        refute changeset.valid?
        assert changeset.errors[:title] == {"can't be blank", [validation: :required]}

      end

      test "accepts valid params" do
        params = %{title: "john"}
        changeset = AlbumWithEmbeds.changeset(%AlbumWithEmbeds{}, params)
        assert changeset.valid?
      end
    end
  end

end
