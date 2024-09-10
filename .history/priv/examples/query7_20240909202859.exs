
import ExUnit.Assertions

import Ecto.Query
alias Ecto.Query
alias MusicDB.Repo

q = from a in "artists", select: [a.name], order_by: a.name
IO.inspect(Repo.all(q))


q = from a in "artists", select: [a.name], order_by: [desc: a.name]
Repo.all(q)

IO.inspect(Repo.all(q))

q = from t in "tracks", select: [t.album_id, t.title, t.index],
  order_by: [t.album_id, t.index]
Repo.all(q)


C
q = from t in "tracks", select: [t.album_id, t.title, t.index],
  order_by: [desc: t.album_id, asc: t.index]
Repo.all(q)



if Repo.using_postgres?() do
  q = from t in "tracks", select: [t.album_id, t.title, t.index],
    order_by: [desc: t.album_id, asc_nulls_first: t.index]
  Repo.all(q)

end

assert [[5, "Anton's Ball", 1] | _tail] = Repo.all(q)

q = from t in "tracks", select: [t.album_id, t.title, t.index],
  order_by: [t.index, t.album_id]
Repo.all(q)


assert [[1, "So What", 1] | _tail] = Repo.all(q)

q = from t in "tracks", select: [t.album_id, sum(t.duration)],
  group_by: t.album_id

assert %Query{} = q

Repo.all(q)

if Repo.using_postgres?() do
  assert MapSet.new([[4, 2540], [1, 2619], [5, 3057], [3, 3456], [2, 4491]]) == MapSet.new(Repo.all(q))
end

q = from t in "tracks", select: [t.album_id, sum(t.duration)],
  group_by: t.album_id,
having: sum(t.duration) > 3600
Repo.all(q)

if Repo.using_postgres?() do
  assert [[2, 4491]] = Repo.all(q)
end

tracks_query = from t in "tracks", select: t.title
union_query = from a in "albums", select: a.title,
  union: ^tracks_query
Repo.all(union_query)

titles = ["Without a Song", "Gary's Theme", "Miles", "Kind Of Blue"]
result = Repo.all(union_query)
assert Enum.all?(titles, fn title -> title in result end)

tracks_query = from t in "tracks", select: t.title
union_query = from a in "albums", select: a.title,
  union_all: ^tracks_query
Repo.all(union_query)

result = Repo.all(union_query)
assert Enum.all?(titles, fn title -> title in result end)

tracks_query = from t in "tracks", select: t.title
intersect_query = from a in "albums", select: a.title,
  intersect: ^tracks_query

assert %Query{} = intersect_query
assert ["You Must Believe In Spring"] == Repo.all(intersect_query)

tracks_query = from t in "tracks", select: t.title
except_query = from a in "albums", select: a.title,
  except: ^tracks_query

assert "You Must Believe In Spring" not in Repo.all(except_query)
