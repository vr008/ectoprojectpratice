
defmodule MusicDB.AlbumTest do
  use ExUnit.Case, async: true
  alias MusicDB.{Album, Repo}
  alias Ecto.Changeset

  describe "changeset/2" do
    test "requires title" do
      changeset = Album.changeset(%Album{}, %{})
      refute changeset.valid?
      assert changeset.errors[:title] == {"can't be blank", [validation: :required]}
    end

    test "accepts valid params" do
      params = %{title: "Greatest Hits"}
      changeset = Album.changeset(%Album{}, params)
      assert changeset.valid?
    end
    test "requires genres" do
      changeset = Genre.changeset(%Genre{}, %{})
      refute changeset.valid?
      assert changeset.errors[:name] == {"can't be blank", [validation: :required]}
      assert changeset.errors[:wiki] == {"day must be between 1 and 31", []}

    end

  end
end
