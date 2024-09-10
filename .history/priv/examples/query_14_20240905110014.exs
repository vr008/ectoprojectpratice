
import ExUnit.Assertions

import Ecto.Query
alias MusicDB.Repo

result =
Repo.update_all("artists", set: [updated_at: DateTime.utc_now])

assert {3, nil} = result

q = from t in "tracks", where: t.title == "Autum Leaves"
Repo.update_all(q, set: [title: "Autumn Leaves"])

assert {0, nil} = Repo.update_all(q, set: [title: "Autumn Leaves"])

result =
from(t in "tracks", where: t.title == "Autum Leaves")
|> Repo.update_all(set: [title: "Autumn Leaves"])

assert {0, nil} = result

result =
from(t in "tracks", where: t.title == "Autum Leaves")
|> Repo.delete_all

assert {0, nil} = result
