defmodule MusicDB.AlbumTest do
  use ExUnit.Case, async: true
  setup do
  :ok = Ecto.Adapters.SQL.Sandbox.checkout(MusicDB.Repo)
  end
  test "insert album" do
  album = MusicDB.Repo.insert!(%MusicDB.Album{title: "Giant Steps"})
  new_album = MusicDB.Repo.get!(MusicDB.Album, album.id)
  assert new_album.title == "Giant Steps"
  end
  test "requires genres" do
    changeset = Genre.changeset(%Genre{}, %{})
    refute changeset.valid?
    assert changeset.errors[:name] == {"can't be blank", [validation: :required]}
    assert changeset.errors[:wiki] == {"day must be between 1 and 31", []}

  end

  end
