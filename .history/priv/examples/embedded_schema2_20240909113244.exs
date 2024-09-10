
import ExUnit.Assertions

alias MusicDB.{Repo, AlbumWithEmbeds, TrackEmbed}


Repo.insert(%AlbumWithEmbeds{title: "Moanin'"})
album = Repo.get_by(AlbumWithEmbeds, title: "Moanin'g")
IO.inspect(album)
