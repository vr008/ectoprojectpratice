
import ExUnit.Assertions

import Ecto.Query
alias Ecto.Query
alias MusicDB.Repo

artist_id = "1"
q = from "artists", where: [id: type(^artist_id, :integer)],
  select: [:name]
IO.inspect(Repo.all(q))


track_id = "1"
q = from "tracks", where: [id: type(^track_id, :integer)],
  select: [:title, :duration, :index, :number_of_plays]

IO.inspect(Repo.all(q))

alias MusicDB.Track

track_id = "1"
q = from Track, where: [id: ^track_id]

IO.inspect(Repo.all(q))

track_id = "1"
q = from Track, where: [id: ^track_id]
Repo.all(q)


IO.inspect(Repo.all(q))

q = from Track, where: [id: ^track_id], select: [:title]
Repo.all(q)
IO.inspect(Repo.all(q))



q = from t in Track, where: t.id == ^track_id

IO.inspect(Repo.all(q))
