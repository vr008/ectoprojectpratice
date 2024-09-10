
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

assert {:ok, %Log{}} = result

assert_raise(FunctionClauseError, fn ->
  artist = %Artist{name: "Ben Webster"}
  Repo.transaction(fn ->
    Repo.insert!(artist)
    Repo.insert!(nil) 
  end)
  #=> ** (FunctionClauseError) no function clause matching in
  #=> Ecto.Repo.Schema.insert/4
end)

Repo.get_by(Artist, name: "Ben Webster")
# => nil

assert nil == Repo.get_by(Artist, name: "Ben Webster")
