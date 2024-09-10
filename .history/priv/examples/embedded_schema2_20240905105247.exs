
import ExUnit.Assertions

alias MusicDB.{Repo, AlbumWithEmbeds, TrackEmbed}

Repo.get_by(AlbumWithEmbeds, title: "Moanin'")


assert %AlbumWithEmbeds{title: "Moanin'"} = Repo.get_by(AlbumWithEmbeds, title: "Moanin'")
