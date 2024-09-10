
import ExUnit.Assertions

import Ecto.Query
alias MusicDB.Repo

q = from "artists", where: [name: "Bill Evans"], select: [:id, :name]
Repo.all(q)
#=> [%{id: 2, name: "Bill Evans"}]

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
#=> #Ecto.Query<from a in "artists", where: a.name == ^"Bill Evans",
#=> select: [:id, :name]>

assert %Ecto.Query{} = q
