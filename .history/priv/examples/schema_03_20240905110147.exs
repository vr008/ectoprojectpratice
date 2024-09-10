
import ExUnit.Assertions

import Ecto.Query
alias MusicDB.Repo

q = from a in "artists",
  join: al in "albums",
  on: a.id == al.artist_id,
  group_by: a.name,
  select: %{artist: a.name, number_of_albums: count(al.id)}
Repo.all(q)


assert MapSet.new([%{artist: "Miles Davis", number_of_albums: 2},
  %{artist: "Bobby Hutcherson", number_of_albums: 1},
  %{artist: "Bill Evans", number_of_albums: 2}]) == MapSet.new(Repo.all(q))
