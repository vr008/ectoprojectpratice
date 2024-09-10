
import ExUnit.Assertions

import Ecto.Query
alias MusicDB.{Repo, Album, Artist, Track}

album = Repo.get_by(Album, title: "Kind Of Blue")

assert %Album{title: "Kind Of Blue"} = album

album.tracks

assert %Ecto.Association.NotLoaded{} = album.tracks

#Ecto.Association.NotLoaded<association :tracks is not loaded>

albums = Repo.all(from a in Album, preload: :tracks)

assert %Track{} = hd(hd(albums).tracks)

albums =
  Album
  |> Repo.all
  |> Repo.preload(:tracks)

assert %Track{} = List.first(List.first(albums).tracks)

result =
Repo.all(from a in Artist, preload: [albums: :tracks])

assert %Track{} = hd(hd(hd(result).albums).tracks)

q = from a in Album,
  join: t in assoc(a, :tracks),
  where: t.title == "Freddie Freeloader",
  preload: [tracks: t]

assert %Ecto.Query{} = q
