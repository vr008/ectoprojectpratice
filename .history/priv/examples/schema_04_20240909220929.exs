
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

IO.inspect(Repo.all(r))
