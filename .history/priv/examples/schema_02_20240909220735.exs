
import ExUnit.Assertions

import Ecto.Query
alias Ecto.Query
alias MusicDB.Repo

artist_id = "1"
q = from "artists", where: [id: type(^artist_id, :integer)],
  select: [:name]
IO.inspect(Repo.all(q)


track_id = "1"
q = from "tracks", where: [id: type(^track_id, :integer)],
  select: [:title, :duration, :index, :number_of_plays]

assert %Query{} = q

alias MusicDB.Track

track_id = "1"
q = from Track, where: [id: ^track_id]

assert %Query{} = q

track_id = "1"
q = from Track, where: [id: ^track_id]
Repo.all(q)
#=> [%MusicDB.Track{__meta__: #Ecto.Schema.Metadata<:loaded, "tracks">,
#=> album: #Ecto.Association.NotLoaded<association :album is not loaded>,
#=> album_id: 1, duration: 544, id: 1, index: 1,
#=> inserted_at: ~N[2017-03-13 13:25:38], number_of_plays: 0,
#=> title: "So What", updated_at: ~N[2017-03-13 13:25:38]}]

assert [%Track{title: "So What"}] = Repo.all(q)

q = from Track, where: [id: ^track_id], select: [:title]
Repo.all(q)
#=> [%MusicDB.Track{__meta__: #Ecto.Schema.Metadata<:loaded, "tracks">,
#=>   album: #Ecto.Association.NotLoaded<association :album is not loaded>,
#=>   album_id: nil, duration: nil, id: nil, index: nil, inserted_at: nil,
#=>   number_of_plays: nil, title: "So What", updated_at: nil}]

assert [%Track{album_id: nil, title: "So What"}] = Repo.all(q)

q = from t in Track, where: t.id == ^track_id

assert %Query{} = q
