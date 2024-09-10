
import ExUnit.Assertions

alias MusicDB.{Repo, Artist, Album, Note}




defmodule Polymorphism3 do
  use Ecto.Schema
  import Ecto.Changeset
  artist = Repo.get_by(Artist, name: "Bobby Hutcherson")
  note = Ecto.build_assoc(artist, :notes,note: "My fave vibes player", author: "darin")
  Repo.insert!(note)
  artist = Repo.preload(artist, :notes)
  artist.notes
end
