defmodule Artist_Embed_Test do
  use ExUnit.Case, async: true
  import Ecto.Changeset
  use Ecto.Schema
  alias MusicDB.ArtistEmbed
  describe "changeset/2" do
    test "requires note author" do
      changeset = ArtistEmbed.changeset(%ArtistEmbed{}, %{})
      refute changeset.valid?
      assert changeset.errors[:title] == {"can't be blank", [validation: :required]}

    end

    test "accepts valid params" do
      params = %{title "john"}
      changeset = ArtistEmbed.changeset(%ArtistEmbed{}, params)
      assert changeset.valid?
    end
  end
end
