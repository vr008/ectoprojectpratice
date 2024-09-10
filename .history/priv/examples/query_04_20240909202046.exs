
import ExUnit.Assertions

import Ecto.Query
alias MusicDB.Repo

album_id ="1
q = from "albums", where: [id: ^artist_id], select: [:name]
Repo.all(q)

assert [%{name: "Kind Of Blue"}] = Repo.all(q)

if Repo.using_postgres?() do
  assert_raise(DBConnection.EncodeError, fn ->

    artist_id = "1"
    q = from "artists", where: [id: ^artist_id], select: [:name]
    Repo.all(q)


  end)
end

artist_id = "1"
q = from "artists", where: [id: type(^artist_id, :integer)], select: [:name]
Repo.all(q)

assert [%{name: "Miles Davis"}] = Repo.all(q)
