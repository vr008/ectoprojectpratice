alias MusicDB.Track
import ExUnit.Assertions

import Ecto.Changeset
import Ecto.Query
alias MusicDB.{Repo, AlbumWithEmbeds, TrackEmbed,Artist,Album}

album = Repo.get_by(Album, title: "Kind Of Blue")
note = Ecto.build_assoc(album, :notes,
note: "Love this album!", author: "darin")
Repo.insert!(note)
album = Repo.preload(album, :notes)
album.notes
