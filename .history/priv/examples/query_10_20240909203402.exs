
import ExUnit.Assertions

import Ecto.Query
alias Ecto.Query
alias MusicDB.Repo

q = from a in "albums",
  join: ar in "artists", on: a.artist_id == ar.id,
  where: ar.name == "Miles Davis",
  select: [a.title]
Repo.all(q)

IO.inspect(Repo.all(q))

q = from a in "albums",
  join: ar in "artists", on: a.artist_id == ar.id,
  join: t in "tracks", on: t.album_id == a.id,
  where: ar.name == "Miles Davis",
  select: [t.title]

  IO.inspect(Repo.all(q))
  Enum.count(Repo.all(q)) == 10
