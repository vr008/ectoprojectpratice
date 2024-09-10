
import ExUnit.Assertions

import Ecto.Query
alias Ecto.Query
alias MusicDB.Repo

albums_by_miles = from a in "albums",
  join: ar in "artists", on: a.artist_id == ar.id,
  where: ar.name == "Miles Davis"

IO.inspect(albums_by_miles

q = from [a,ar] in albums_by_miles,
  where: ar.name == "Bobby Hutcherson",
  select: a.title

Repo.to_sql(:all, q)

assert {_sql, []} = Repo.to_sql(:all, q)

q = from a in "albums",
  join: ar in "artists", on: a.artist_id == ar.id,
  where: ar.name == "Miles Davis" or ar.name == "Bobby Hutcherson",
  select: %{artist: ar.name, album: a.title}

assert %Query{} = q

q = from [a,ar] in albums_by_miles, or_where: ar.name == "Bobby Hutcherson",
  select: %{artist: ar.name, album: a.title}

assert %Query{} = q

q = from [a,ar] in albums_by_miles, or_where: ar.name == "Bobby Hutcherson",
  select: %{artist: ar.name, album: a.title}
Repo.all(q)


assert MapSet.new([%{album: "Kind Of Blue", artist: "Miles Davis"},
  %{album: "Cookin' At The Plugged Nickel", artist: "Miles Davis"},
  %{album: "Live At Montreaux", artist: "Bobby Hutcherson"}]) == MapSet.new(Repo.all(q))
