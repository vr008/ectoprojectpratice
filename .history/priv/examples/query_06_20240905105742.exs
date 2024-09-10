
import ExUnit.Assertions

import Ecto.Query
alias Ecto.Query

q = from a in "artists", where: like(a.name, "Miles%"), select: [:id, :name]


assert %Query{} = q

# checking for null
q = from a in "artists", where: is_nil(a.name), select: [:id, :name]


assert %Query{} = q

q = from a in "artists", where: not is_nil(a.name), select: [:id, :name]


assert %Query{} = q

q = from a in "artists", where: a.inserted_at < ago(1, "year"),
  select: [:id, :name]

assert %Query{} = q
