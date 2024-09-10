
defmodule MusicDB.Note_Test do
  use ExUnit.Case, async: true
  alias MusicDB.{Artist, Repo,SoloArtist,Genre,Note}
  alias Ecto.Changeset

  describe "changeset/2" do
    test "requires note author" do
      changeset = Note.changeset(%Note{}, %{})
      refute changeset.valid?
      assert changeset.errors[:note] == {"can't be blank", [validation: :required]}
      assert changeset.errors[:author] == {"can't be blank", [validation: :required]}

    end

    test "accepts valid params" do
      params = %{note: "john", author: "helll"}
      changeset = Artist.changeset(%Note{}, params)
      assert changeset.valid?
    end






  end

end
