
import ExUnit.Assertions

import Ecto.Query
alias MusicDB.{Repo, Artist, Album}

artist = Repo.get_by(Artist, name: "Miles Davis")
new_album = Ecto.build_assoc(artist, :albums)

artist = Repo.get_by(Artist, name: "Miles Davis")
album = Ecto.build_assoc(artist, :albums, title: "Miles Ahead")


artist = Repo.get_by(Artist, name: "Miles Davis")
album = Ecto.build_assoc(artist, :albums, title: "Miles Ahead")
Repo.insert(album)


artist = Repo.one(from a in Artist, where: a.name == "Miles Davis",
  preload: :albums)
Enum.map(artist.albums, &(&1.title))

IO.inspect(MapSet.new(Enum.map(artist.albums, &(&1.title))))
