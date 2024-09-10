
import ExUnit.Assertions

import Ecto.Query
alias MusicDB.Repo



query = from t in "tracks",
  join: a in "albums", on: t.album_id == a.id,
  where: t.duration > 900,
  select: [t.id, t.title, a.title]

q= from a in "albums",
   join: s in "sold_units", on: s.album_id == a.id,
   join: g in "albums_genres", on: g.album_id == a.id,
   join: gr in "genres", on: g.genre_id == gr.id,
   where: s.sold_units >10,
   select: [a.id,a.title,gr.name,s.sold_units]

IO.inspect(Repo.all(q))

IO.inspect(Repo.all(q))

query = "ratings"
|> join(:inner, [t], a in "artists", on: t.artist_id == a.id)
|> where([t,a], t.rating > 0)
|> select([t,a], [a.id, a.name,t.rating ])
IO.inspect(Repo.all(query))

IO.inspect(Repo.all(q))

query = from "artists", select: [:name]

assert %Ecto.Query{} = query

query = from "artists", select: [:name]
Ecto.Adapters.SQL.to_sql(:all, Repo, query)

query = from "artists", select: [:name]
Repo.to_sql(:all, query)



query = Ecto.Query.from("artists", select: [:name])

assert %Ecto.Query{} = query

assert_raise(Ecto.QueryError, fn ->

query = from "artists"
Repo.all(query)

end)

query = from "artists", prefix: "public", select: [:name]

assert %Ecto.Query{} = query
q = from "artists", where: [name: "Bill Evans"], select: [:id, :name]
Repo.all(q)

assert [%{name: "Bill Evans"}] = Repo.all(q)

assert_raise(Ecto.Query.CompileError, fn ->
  ast = quote do

    artist_name = "Bill Evans"
    q = from "artists", where: [name: artist_name], select: [:id, :name]

  end
  Code.eval_quoted(ast, [], __ENV__)
end)

artist_name = "Bill Evans"
q = from "artists", where: [name: ^artist_name], select: [:id, :name]


assert %Ecto.Query{} = q
