
import ExUnit.Assertions

import Ecto.Query
alias MusicDB.Repo



query = from t in "tracks",
  join: a in "albums", on: t.album_id == a.id,
  where: t.duration > 900,
  select: [t.id, t.title, a.title]

q= from a in "albums",
    
assert %Ecto.Query{} = query

query = "tracks"
|> join(:inner, [t], a in "albums", on: t.album_id == a.id)
|> where([t,a], t.duration > 900)
|> select([t,a], [t.id, t.title, a.title])

assert %Ecto.Query{} = query

query = from "artists", select: [:name]
#=> #Ecto.Query<from a in "artists", select: [:name]>

assert %Ecto.Query{} = query

query = from "artists", select: [:name]
Ecto.Adapters.SQL.to_sql(:all, Repo, query)
#=> {"SELECT a0.\"name\" FROM \"artists\" AS a0", []}

query = from "artists", select: [:name]
Repo.to_sql(:all, query)

query = from "artists", select: [:name]
Repo.all(query)
#=> [%{name: "Miles Davis"}, %{name: "Bill Evans"},
#=> %{name: "Bobby Hutcherson"}]

assert [%{}, %{}, %{}] = Repo.all(query)

query = Ecto.Query.from("artists", select: [:name])

assert %Ecto.Query{} = query

assert_raise(Ecto.QueryError, fn ->

query = from "artists"
Repo.all(query)
#=> ** (Ecto.QueryError) ...

end)

query = from "artists", prefix: "public", select: [:name]

assert %Ecto.Query{} = query
