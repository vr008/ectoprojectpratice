
import ExUnit.Assertions

alias MusicDB.{Repo, AlbumWithEmbeds, TrackEmbed}


Repo.insert(AlbumWithEmbeds{title: "Moanin'g"})
#assert %AlbumWithEmbeds{title: "Moanin'"} = Repo.get_by(AlbumWithEmbeds, title: "Moanin'")
