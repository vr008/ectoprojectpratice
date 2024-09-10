
import ExUnit.Assertions

import Ecto.Query
alias MusicDB.Repo

q = from a in "artists",
  join: al in "albums",
  on: a.id == al.artist_id,
  group_by: a.name,
  select: %{artist: a.name, number_of_albums: count(al.id)}
Repo.all(q)

IO.inspect(MapSet.new(Repo.all(q))
