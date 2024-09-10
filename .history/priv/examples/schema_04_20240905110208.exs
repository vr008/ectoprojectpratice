
import ExUnit.Assertions

alias MusicDB.{Repo, Artist}

result =
Repo.insert_all("artists", [[name: "John Coltrane"]])

assert {1, nil} = result

result =
Repo.insert(%Artist{name: "John Coltrane"})


assert {:ok, %MusicDB.Artist{}} = result

result =
Repo.insert_all(Artist, [[name: "John Coltrane"]])

assert {1, nil} = result
