
import ExUnit.Assertions

alias MusicDB.{Repo, Artist, Log}

result = (fn ->
  artist = %Artist{name: "Johnny Hodges"}
  Repo.transaction(fn ->
    Repo.insert!(artist)
    Repo.insert!(Log.changeset_for_insert(artist))
  end)
end).()

IO.inspect(result)

alias Ecto.Multi

artist = %Artist{name: "Johnny Hodges"}
multi =
  Multi.new
  |> Multi.insert(:artist, artist)
  |> Multi.insert(:log, Log.changeset_for_insert(artist))
Repo.transaction(multi)

result =
  Repo.transaction(multi)


IO.result
