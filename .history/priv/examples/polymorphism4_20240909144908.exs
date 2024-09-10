
import ExUnit.Assertions

alias MusicDB.{Repo, Artist, Album, Note}

defmodule Polymorphism4 do
  use Ecto.Schema
  import Ecto.Changeset
album = Repo.get_by(Album, title: "Kind Of Blue")
note = Repo.insert!(%Note{note: "Love this album!", author: "darin"})
album
|> Repo.preload(:notes)
|> Ecto.Changeset.change()
|> Ecto.Changeset.put_assoc(:notes, [note])
|> Repo.update!
album = Repo.preload(album, :notes)
album.notes
IO
end
