
import ExUnit.Assertions

alias MusicDB.{Repo, AlbumWithEmbeds, TrackEmbed}


Repo.insert_all(AlbumWithEmbeds, title: "Moanin'")
#assert %AlbumWithEmbeds{title: "Moanin'"} = Repo.get_by(AlbumWithEmbeds, title: "Moanin'")
