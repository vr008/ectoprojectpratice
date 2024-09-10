
alias MusicDB.{Repo, Album, Note}

defmodule Polymorphism1 do
  album = Repo.get_by(Album, title: "Kind Of Blue")
  note = Ecto.build_assoc(album, :notes,
  note: "Love this album!", author: "darin")
  Repo.insert!(note)
  album = Repo.preload(album, :notes)
  album.notes
end
