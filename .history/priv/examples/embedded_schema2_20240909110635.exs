
import ExUnit.Assertions

alias MusicDB.{Repo, AlbumWithEmbeds, TrackEmbed}


#Repo.insert(%AlbumWithEmbeds{title: "Moanin'g"})
Repo.get_by(AlbumWithEmbeds, title: "Moanin'")
