alias MusicDB.Track
import ExUnit.Assertions

import Ecto.Changeset
import Ecto.Query
alias MusicDB.{Repo, AlbumWithEmbeds, TrackEmbed}
#Repo.get_by(AlbumWithEmbeds, title: "Moanin'")
#album = Repo.get_by(AlbumWithEmbeds, title: "Moanin'")
#changeset = change(album)
#changeset = put_embed(changeset, :artist, %{name: "Arthur Blakey"})
#changeset = put_embed(changeset, :tracks,
#[%TrackEmbed{title: "Moanin'"}])
album = Repo.get_by(AlbumWithEmbeds, title: "Moanin'")
changeset = change(album)
changeset = put_embed(changeset, :artist, %{name: "Arthur Blakey"})
