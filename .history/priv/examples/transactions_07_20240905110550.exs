
import ExUnit.Assertions

alias Ecto.{Multi, Changeset}
alias MusicDB.{Repo, Artist, Log}

artist = %Artist{name: "Toshiko Akiyoshi"}
multi =
  Multi.new()
  |> Multi.insert(:artist, artist)
  |> Multi.insert(:log, Log.changeset_for_insert(artist))
  |> Multi.run(:search, fn _repo, changes ->
    SearchEngine.update(changes[:artist])
  end)
Repo.transaction(multi)

assert {:ok, %{artist: %Artist{}, log: %Log{}, search: %Artist{}}} = Repo.transaction(multi)

multi =
  Multi.new()
  |> Multi.insert(:artist, artist)
  |> Multi.insert(:log, Log.changeset_for_insert(artist))
  |> Multi.run(:search, SearchEngine, :update, ["extra argument"])

assert %Multi{} = multi

multi =
  Multi.new()
  |> Multi.insert(:artist, artist)
  |> Multi.insert(:log, Log.changeset_for_insert(artist))
  |> Multi.run(:search, SearchEngine, :update, ["extra argument"])
Multi.to_list(multi)
#=> [
#=>   artist: {:insert,
#=>    #Ecto.Changeset<action: :insert, changes: %{}, errors: [],
#=>     data: #MusicDB.Artist<>, valid?: true>, []},
#=>   log: {:insert,
#=>    #Ecto.Changeset<action: :insert, changes: %{}, errors: [],
#=>     data: #MusicDB.Log<>, valid?: true>, []},
#=>   search: {:run, {SearchEngine, :update, ["extra argument"]}}
#=> ]

assert [artist: {:insert, %Changeset{}, []},
  log: {:insert, %Changeset{}, []},
  search: {:run, {SearchEngine, :update, ["extra argument"]}}] = Multi.to_list(multi)
