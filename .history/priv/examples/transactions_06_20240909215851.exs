
import ExUnit.Assertions
import ExUnit.CaptureIO

alias Ecto.{Multi, Changeset}
alias MusicDB.{Repo, Artist, Genre}

Repo.insert!(%Artist{name: "Johnny Hodges"})

artist = Repo.get_by(Artist, name: "Johnny Hodges")
artist_changeset = Artist.changeset(artist,
  %{name: "John Cornelius Hodges"})
invalid_changeset = Artist.changeset(%Artist{},
  %{name: nil})
multi =
  Multi.new
  |> Multi.update(:artist, artist_changeset)
  |> Multi.insert(:invalid, invalid_changeset)
Repo.transaction(multi)


Repo.transaction(multi)

result = capture_io(fn ->
  case Repo.transaction(multi) do
    {:ok, _results} ->
      IO.puts "Operations were successful."
    {:error, :artist, changeset, _changes} ->
      IO.puts "Artist update failed"
      IO.inspect changeset.errors
    {:error, :invalid, changeset, _changes} ->
      IO.puts "Invalid operation failed"
      IO.inspect changeset.errors
  end
end)

IO.inspect(String.match?(result, ~r{Invalid operation failed}))

artist = Repo.get_by(Artist, name: "Johnny Hodges")
artist_changeset = Artist.changeset(artist,
  %{name: "John Cornelius Hodges"})
invalid_changeset = Artist.changeset(%Artist{},
  %{name: nil})
multi =
  Multi.new
  |> Multi.update(:artist, artist_changeset)
  |> Multi.insert(:invalid, invalid_changeset)
Repo.transaction(multi)


IO.inspect(Repo.transaction(multi))

artist = Repo.get_by(Artist, name: "Johnny Hodges")
artist_changeset = Artist.changeset(artist,
  %{name: "John Cornelius Hodges"})
genre_changeset =
  %Genre{}
  |> Ecto.Changeset.cast(%{name: "jazz"}, [:name])
  |> Ecto.Changeset.unique_constraint(:name)
multi =
  Multi.new
  |> Multi.update(:artist, artist_changeset)
  |> Multi.insert(:bad_genre, genre_changeset)
Repo.transaction(multi)


IO.inspect(Repo.transaction(multi))

Repo.get_by(Artist, name: "John Cornelius Hodges")

IO.inspect(Repo.get_by(Artist, name: "John Cornelius Hodges"))

multi =
  Multi.new
  |> Multi.insert(:artist, %Artist{})

multi


if Repo.using_postgres?() do
  assert_raise(Postgrex.Error, fn ->
    Repo.transaction(multi)

  end)
else
  assert_raise(Mariaex.Error, fn ->
    Repo.transaction(multi)
  end)
end
