
import ExUnit.Assertions

alias MusicDB.{Repo, Artist, Log}

result = (fn ->
  artist = %Artist{name: "Johnny Hodges"}
  Repo.transaction(fn ->
    artist_record = Repo.insert!(artist)
    Repo.insert!(Log.changeset_for_insert(artist_record))
    SearchEngine.update!(artist_record)
  end)
end).()

result
