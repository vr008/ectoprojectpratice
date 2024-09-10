
import ExUnit.Assertions

alias MusicDB.{Repo, Artist, Log}

artist = %Artist{name: "Johnny Hodges"}
Repo.insert(artist)
Repo.insert(Log.changeset_for_insert(artist))

result = (fn ->
  artist = %Artist{name: "Johnny Hodges"}
  Repo.transaction(fn ->
    Repo.insert!(artist)
    Repo.insert!(Log.changeset_for_insert(artist))
  end)
end).()

IO.inspect()
assert_raise(FunctionClauseError, fn ->
  artist = %Artist{name: "Ben Webster"}
  Repo.transaction(fn ->
    Repo.insert!(artist)
    Repo.insert!(nil)
  end)

end)

Repo.get_by(Artist, name: "Ben Webster")

assert nil == Repo.get_by(Artist, name: "Ben Webster")
