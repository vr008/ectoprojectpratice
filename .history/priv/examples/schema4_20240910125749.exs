
import ExUnit.Assertions

alias MusicDB.{Repo, Artist}

result =
Repo.insert_all("artists", [[name: "John Coltrane"]])

IO.inspect(Repo.all(result))

result =
Repo.insert(%Artist{name: "John Coltrane"})


IO.inspect(Repo.all(result))

result =
Repo.insert_all(Artist, [[name: "John Coltrane"]])

IO.inspect(Repo.all(result))
result =
  Repo.delete_all("tracks")

  IO.inspect(Repo.all(result))

  result =
  from(t in "tracks", where: t.title == "Autum Leaves")
  |> Repo.delete_all

  IO.inspect(Repo.all(result))

  Repo.insert!(%Track{title: "The Moontrane", index: 1})

  delete_fn = fn () ->
    track = Repo.get_by(Track, title: "The Moontrane")
    Repo.delete(track)

  end

  IO.inspect(delete_fn.())
