
import ExUnit.Assertions

import Ecto.Query
alias Ecto.Query

q = from a in "artists", where: like(a.name, "Miles%"), select: [:id, :name]


IO.inspect(q)
q = from a in "artists", where: is_nil(a.name), select: [:id, :name]


IO.inspect(q)

q = from a in "artists", where: not is_nil(a.name), select: [:id, :name]


IO.inspect(q)

q = from a in "artists", where: a.inserted_at < ago(1, "year"),
  select: [:id, :name]

  IO.inspect(q)

  q = from a in "artists", select: [a.name], order_by: a.name
  IO.inspect(Repo.all(q))


  q = from a in "artists", select: [a.name], order_by: [desc: a.name]
  Repo.all(q)

  IO.inspect(Repo.all(q))

  q = from t in "tracks", select: [t.album_id, t.title, t.index],
    order_by: [t.album_id, t.index]
  Repo.all(q)


  IO.inspect(Repo.all(q))

  q = from t in "tracks", select: [t.album_id, t.title, t.index],
    order_by: [desc: t.album_id, asc: t.index]
  Repo.all(q)

  IO.inspect(Repo.all(q))




  q = from t in "tracks", select: [t.album_id, t.title, t.index],
    order_by: [t.index, t.album_id]
  Repo.all(q)


  IO.inspect(Repo.all(q))

  q = from t in "tracks", select: [t.album_id, sum(t.duration)],
    group_by: t.album_id

    IO.inspect(Repo.all(q))



  q = from t in "tracks", select: [t.album_id, sum(t.duration)],
    group_by: t.album_id,
  having: sum(t.duration) > 3600
  IO.inspect(Repo.all(q))



  tracks_query = from t in "tracks", select: t.title
  union_query = from a in "albums", select: a.title,
    union: ^tracks_query
  IO.inspect(Repo.all(union_query))

  titles = ["Without a Song", "Gary's Theme", "Miles", "Kind Of Blue"]
  result = Repo.all(union_query)
  IO.inspect(Repo.all(result))

  tracks_query = from t in "tracks", select: t.title
  union_query = from a in "albums", select: a.title,
    union_all: ^tracks_query
  IO.inspect(Repo.all(q))

  result = Repo.all(union_query)
  IO.inspect(Repo.all(result))

  tracks_query = from t in "tracks", select: t.title
  intersect_query = from a in "albums", select: a.title,
    intersect: ^tracks_query

    IO.inspect(Repo.all(tracks_query))


  tracks_query = from t in "tracks", select: t.title
  except_query = from a in "albums", select: a.title,
    except: ^tracks_query

    IO.inspect(Repo.all(except_query))
