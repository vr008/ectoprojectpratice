
import ExUnit.Assertions

alias MusicDB.{Repo, Artist, Album, Note}




defmodule Polymorphism1 do
  use Ecto.Schema
  import Ecto.Changeset
  album = Repo.get_by(Album, title: "Kind Of Blue")
  note = Ecto.build_assoc(album, :notes,
  note: "Love this album!", author: "darin")

  artist = Repo.get_by(Artist, name: "Bobby Hutcherson")
  note = Ecto.build_assoc(album,artist, :notes,
  note: "My fave vibes player", author: "darin")
  Repo.insert!(note)
  artist = Repo.preload(artist, :notes)
  artist.notes
end
