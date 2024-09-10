
import ExUnit.Assertions

import Ecto.Query
alias MusicDB.Repo

artist_name = "Bill Evans"
q = from "artists", where: [name: ^artist_name], select: [:id, :name]
Ecto.Adapters.SQL.to_sql(:all, Repo, q)


assert {_query, ["Bill Evans"]} = Ecto.Adapters.SQL.to_sql(:all, Repo, q)
