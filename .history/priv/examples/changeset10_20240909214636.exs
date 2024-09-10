
import ExUnit.Assertions

import Ecto.Changeset
import Ecto.Query
alias MusicDB.{Repo, Artist, Album}


assert_raise(RuntimeError, fn ->
changeset = Repo.get_by(Artist, name: "Miles Davis")
  |> change
  |> put_assoc(:albums, [%Album{title: "Miles Ahead"}])
Repo.update(changeset)

end)

assert_raise(RuntimeError, fn ->
changeset = Repo.get_by(Artist, name: "Miles Davis")
  |> Repo.preload(:albums)
  |> change
  |> put_assoc(:albums, [%Album{title: "Miles Ahead"}])
Repo.update(changeset)

end)

artist =
  Repo.get_by(Artist, name: "Miles Davis")
  |> Repo.preload(:albums)

artist
 |> change
 |> put_assoc(:albums, [%Album{title: "Miles Ahead"} | artist.albums])
 |> Repo.update

IO.inspect(Repo.get_by(Album, title: "Miles Ahead"))

%Artist{name: "Eliane Elias"}
|> change
|> put_assoc(:albums, [%Album{title: "Made In Brazil"}])
|> Repo.insert

%Artist{name: "Eliane Elias"}
|> change
|> put_assoc(:albums, [%{title: "Made In Brazil"}])
|> Repo.insert

%Artist{name: "Eliane Elias"}
|> change
|> put_assoc(:albums, [[title: "Made In Brazil"]])
|> Repo.insert

q = from a in Artist, where: a.name == "Eliane Elias"
IO.inspect(Repo.aggregate(q, :count, :id))

q = from a in Album, where: a.title == "Made In Brazil"
assert 3 == Repo.aggregate(q, :count, :id)
