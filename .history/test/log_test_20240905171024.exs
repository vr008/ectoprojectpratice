defmodule MusicDB.Log_Test do
  use ExUnit.Case, async: true
  alias MusicDB.{AlbumGenre, Album, Genre, Repo,Lo}
  alias Ecto.Changeset

  describe "changeset/2" do
    test "requires album_id and genre_id" do
      changeset = AlbumGenre.changeset(%AlbumGenre{}, %{})
      refute changeset.valid?
      assert changeset.errors[:album_id] == ["can't be blank"]
      assert changeset.errors[:genre_id] == ["can't be blank"]
    end
  end


end
