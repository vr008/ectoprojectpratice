alias MusicDB.Track
import ExUnit.Assertions

import Ecto.Changeset
import Ecto.Query
alias MusicDB.{Repo, AlbumWithEmbeds, TrackEmbed,Artist,Album}
artist = Repo.get_by(Artist, name: "Bobby Hutcherson")
note = Ecto.build_assoc(artist, :notes,
note: "My fave vibes player", author: "darin")
Repo.insert!(note)
artist = Repo.preload(artist, :notes)
artist.notes

