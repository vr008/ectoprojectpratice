alias MusicDB.Track
import ExUnit.Assertions

import Ecto.Changeset
import Ecto.Query
alias MusicDB.{Repo, AlbumWithEmbeds, TrackEmbed,Artist,Album}
#album = Repo.get_by(AlbumWithEmbeds, title: "Moanin'")
#params = %{
#"artist" => %{"name" => "Arthur Blakey"},
#"tracks" => [%{"title" => "Moanin'"}]
#}
#changeset = cast(album, params, [])
#changeset = cast_embed(changeset, :artist)
#changeset = cast_embed(changeset, :tracks)
#IO.inspect(changeset)
#artist = Repo.get_by(Artist, name: "Bobby Hutcherson")
#note = Ecto.build_assoc(artist, :notes,
#note: "My fave vibes player", author: "darin")
#Repo.insert!(note)
#artist = Repo.preload(artist, :notes)
#artist.notes
album = Repo.get_by(Album, title: "Kind Of Blue")
note = Ecto.build_assoc(album, :notes,
note: "Love this album!", author: "darin")
Repo.insert!(note)
album = Repo.preload(album, :notes)
album.notes
