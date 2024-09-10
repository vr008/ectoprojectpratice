
import ExUnit.Assertions

import Ecto.Changeset
alias Ecto.Changeset
alias MusicDB.{Repo, AlbumWithEmbeds, TrackEmbed}

album = Repo.get_by(AlbumWithEmbeds, title: "Moanin'")
changeset = change(album)
changeset = put_embed(changeset, :artist, %{name: "Arthur Blakey"})
changeset = put_embed(changeset, :tracks,
  [%TrackEmbed{title: "Moanin'"}])

assert %Changeset{} = changeset

album = Repo.get_by(AlbumWithEmbeds, title: "Moanin'")
changeset = change(album)
changeset = put_embed(changeset, :artist, %{name: "Arthur Blakey"})
#=> #Ecto.Changeset<
#=>  action: nil,
#=>  changes: %{
#=>    artist: #Ecto.Changeset<
#=>      action: :insert,
#=>      changes: %{name: "Arthur Blakey"},
#=>      errors: [],
#=>      data: #MusicDB.ArtistEmbed<>,
#=>      valid?: true
#=>    >
#=>  },
#=>  errors: [],
#=>  data: #MusicDB.AlbumWithEmbeds<>,
#=>  valid?: true
#=> >

assert %Changeset{changes: %{artist: %Changeset{}}} = changeset
