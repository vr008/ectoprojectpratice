
import ExUnit.Assertions

import Ecto.Query
alias Ecto.Query

q = from "artists", where: [name: "Bill Evans"], select: [:id, :name]

assert %Query{} = q

q = from a in "artists", where: a.name == "Bill Evans", select: [:id, :name]

assert %Query{} = q
