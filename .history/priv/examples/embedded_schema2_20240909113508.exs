
import ExUnit.Assertions

alias MusicDB.{Repo, AlbumWithEmbeds, TrackEmbed}



#Repo.insert(%AlbumWithEmbeds{title: "Moanin'"})
#album = Repo.get_by(AlbumWithEmbeds, title: "Moanin'")
album = Repo.get_by(AlbumWithEmbeds, title: "Moanin'")
changeset = change(album)
changeset = put_embed(changeset, :artist, %{name: "Arthur Blakey"})
changeset = put_embed(changeset, :tracks,
[%TrackEmbed{title: "Moanin'"}])
IO.inspect(album)
