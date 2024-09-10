
import ExUnit.Assertions

import Ecto.Changeset
alias Ecto.Changeset
alias MusicDB.{Repo, AlbumWithEmbeds}

album = Repo.get_by(AlbumWithEmbeds, title: "Moanin'")
params = %{
  "artist" => %{"name" => "Arthur Blakey"},
  "tracks" => [%{"title" => "Moanin'"}]
}

changeset = cast(album, params, [])
changeset = cast_embed(changeset, :artist)
changeset = cast_embed(changeset, :tracks)

assert %Changeset{} = changeset
