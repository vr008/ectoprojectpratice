
import ExUnit.Assertions

import Ecto.Query
alias MusicDB.{Repo, Artist, Album}

artist = Repo.get_by(Artist, name: "Miles Davis")
new_album = Ecto.build_assoc(artist, :albums)

IO.inspect(new_album)
artist = Repo.get_by(Artist, name: "Miles Davis")
album = Ecto.build_assoc(artist, :albums, title: "Miles Ahead")

assert %Album{artist_id: 1, title: "Miles Ahead"} = album

artist = Repo.get_by(Artist, name: "Miles Davis")
album = Ecto.build_assoc(artist, :albums, title: "Miles Ahead")
Repo.insert(album)

assert {:ok, %MusicDB.Album{title: "Miles Ahead", artist_id: 1}} = Repo.insert(album)

artist = Repo.one(from a in Artist, where: a.name == "Miles Davis",
  preload: :albums)
Enum.map(artist.albums, &(&1.title))

assert MapSet.new(["Miles Ahead", "Cookin' At The Plugged Nickel", "Kind Of Blue"]) == MapSet.new(Enum.map(artist.albums, &(&1.title)))
