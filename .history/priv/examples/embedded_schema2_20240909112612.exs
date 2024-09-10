
import ExUnit.Assertions

alias MusicDB.{Repo, AlbumWithEmbeds, TrackEmbed}


#Repo.insert(%AlbumWithEmbeds{title: "Moanin'g"})
album = Repo.get_by(AlbumWithEmbeds, title: "Moanin'g")
