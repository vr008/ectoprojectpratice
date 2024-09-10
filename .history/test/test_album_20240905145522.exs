defmodule Test.Album do
  @valid_params %{title: "Test Album"}
  @invalid_params %{title: nil}
  use ExUnit.Case, async: true
  alias MusicDB.{Album, Repo,Artist}
  alias Ecto.Changeset


  describe "Album schema and changeset tests" do
    test "requires title" do
      changeset = Album.changeset(%Album{}, %{})
      assert Changeset.invalid?(changeset)
      assert Changeset.get_field_error(changeset, :title) == ["can't be blank"]
    end

    test "accepts valid params" do
      params = %{title: "Greatest Hits"}
      changeset = Album.changeset(%Album{}, params)
      assert Changeset.valid?(changeset)
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
end
