defmodule AlbumGenreTest do
  defmodule MusicDB.AlbumGenreTest do
    use ExUnit.Case, async: true
    alias MusicDB.{AlbumGenre, Album, Genre, Repo}
    alias Ecto.Changeset

    describe "schema" do
      test "defines required fields" do
        fields = AlbumGenre.__schema__(:fields)

        assert fields[:album_id]
        assert fields[:genre_id]
      end

      test "defines associations" do
        associations = AlbumGenre.__schema__(:associations)

        assert associations[:albums]
        assert associations[:genres]
      end
    end

    describe "changeset/2" do
      test "requires album_id and genre_id" do
        changeset = AlbumGenre.changeset(%AlbumGenre{}, %{})
        refute changeset.valid?
        assert changeset.errors[:album_id] == ["can't be blank"]
        assert changeset.errors[:genre_id] == ["can't be blank"]
      end

      test "accepts valid params" do
        album = insert_album()
        genre = insert_genre()
        params = %{album_id: album.id, genre_id: genre.id}
        changeset = AlbumGenre.changeset(%AlbumGenre{}, params)
        assert changeset.valid?
      end
    end

    defp insert_album do
      %Album{}
      |> Album.changeset(%{title: "Test Album"})
      |> Repo.insert!()
    end

    defp insert_genre do
      %Genre{}
      |> Genre.changeset(%{name: "Test Genre"})
      |> Repo.insert!()
    end
  end

end
