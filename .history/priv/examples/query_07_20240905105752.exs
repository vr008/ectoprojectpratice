
import ExUnit.Assertions

import Ecto.Query
alias Ecto.Query
alias MusicDB.Repo

q = from a in "artists",
  where: fragment("lower(?)", a.name) == "miles davis",
  select: [:id, :name]

assert %Query{} = q

q = from a in "artists",
  where: fragment("lower(?)", a.name) == "miles davis",
  select: [:id, :name]
Ecto.Adapters.SQL.to_sql(:all, Repo, q)

assert {_sql, []} = Ecto.Adapters.SQL.to_sql(:all, Repo, q)

defmodule Chapter02Example do

  defmacro lower(arg) do
    quote do: fragment("lower(?)", unquote(arg))
  end

  def macro_example do
    q = from a in "artists",
      where: lower(a.name) == "miles davis",
      select: [:id, :name]
  end
end

assert %Query{} = Chapter02Example.macro_example()
