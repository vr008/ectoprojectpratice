alias MusicDB.Track
import ExUnit.Assertions
import Ecto.Changeset
import Ecto.Query
alias MusicDB.{Repo, Artist, Album, Genre,Track,SoldUnits}
defmodule MusicDB.Album do
  use Ecto.Schema
  schema "albums" do
    field(:title, :string)
    timestamps()
    belongs_to(:artist, Artist)
    has_many :tracks, Track,on_replace: :nilify
    has_many :album, Album,on_replace: :nilify
    has_many :sold_unit,SoldUnits,on_replace: :nilify
    many_to_many(:genres, Genre, join_through: "albums_genres")
  end
  def changeset(album, params) do
    album
    |> cast(params, [:title])
    |> validate_required([:title])
    |> foreign_key_constraint(:albums, name: "album_artist_id_fkey")

  end
  describe "foreign key constraint" do
    test "ensures artist_id references a valid artist" do
      artist = insert(:artist)
      album = insert(:album, artist_id: artist.id)

      # Ensure the album was inserted successfully
      assert Repo.get(Album, album.id) != nil

      # Delete the artist and ensure the album's artist_id is set to nil
      Repo.delete(artist)
      updated_album = Repo.get(Album, album.id)
      assert updated_album.artist_id == nil
    end
  end

  defp insert(:artist) do
    %Artist{}
    |> Artist.changeset(%{name: "Test Artist"})
    |> Repo.insert!()
  end

  defp insert(:album, attrs \\ %{}) do
    %Album{}
    |> Album.changeset(attrs)
    |> Repo.insert!()
  end
end
