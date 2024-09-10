
import ExUnit.Assertions

import Ecto.Query
alias MusicDB.Repo

album_id =1
q = from "albums", where: [id: ^album_id], select: [:title]
Repo.all(q)

assert [%{title: "Kind Of Blue"}] = Repo.all(q)

if Repo.using_postgres?() do
  assert_raise(DBConnection.EncodeError, fn ->

    artist_id = "1"
    q = from "artists", where: [id: ^artist_id], select: [:title]
    Repo.all(q)


  end)
end

