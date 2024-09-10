
import ExUnit.Assertions

import Ecto.Query
alias MusicDB.{Repo, Track}

result =
Repo.delete_all("tracks")

assert {33, nil} = result

result =
from(t in "tracks", where: t.title == "Autum Leaves")
|> Repo.delete_all

assert {0, nil} = result

Repo.insert!(%Track{title: "The Moontrane", index: 1})

delete_fn = fn () ->
  track = Repo.get_by(Track, title: "The Moontrane")
  Repo.delete(track)
  #=> {:ok, %MusicDB.Track{__meta__: #Ecto.Schema.Metadata<:deleted, "tracks">,
  #=>  id: 28, title: "The Moontrane", ...}
end

assert {:ok, %Track{title: "The Moontrane"}} = delete_fn.()
