
import ExUnit.Assertions

import Ecto.Query
alias Ecto.Query

q = from "artists", where: [name: "580 West"], select: [:id, :name]
IO.inspect(q)
assert %Query{} = q

q = from a in "artists", where: a.name == "580 West", select: [:id, :name]

assert %Query{} = q
IO.inspect()
