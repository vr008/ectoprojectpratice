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

    
  end
