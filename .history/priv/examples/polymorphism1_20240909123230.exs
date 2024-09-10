
import ExUnit.Assertions

alias MusicDB.{Repo, Artist, Album, Note}


  use Ecto.Schema
  import Ecto.Changeset

def
  artist = Repo.get_by(Artist, name: "Bobby Hutcherson")
  note = Ecto.build_assoc(artist, :notes,
  note: "My fave vibes player", author: "darin")
  Repo.insert!(note)
  artist = Repo.preload(artist, :notes)
  artist.notes
