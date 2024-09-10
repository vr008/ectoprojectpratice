
import ExUnit.Assertions
import Ecto.Query

alias MusicDB.{Repo, Album, Artist, Track}

query =from a in Album,
join: t in assoc(a, :tracks),
join: ar in assoc(a, :artist),
preload: [tracks: t, artist: ar]
result = Repo.all(query)

# Preload with atoms or keyword
from a in Album, preload: [:tracks]
# Preload with anonymous functions
track_fun = fn album_ids ->
Repo.all(from(t in Track, where: t.album_id in ^album_ids))
end
Repo.all(from(a in Album, preload: [tracks: ^track_fun]))
# Using Repo.preload
albums = Repo.all(Album)
Repo.preload(albums, [:tracks])
q = from t in Track, select: [:title, :duration]
IO.inspect(Repo.all(q))

tracks = Repo.all(Track)
Enum.each(tracks, fn track ->
track
|> Ecto.Changeset.change(%{number_of_plays: 0})
|> Repo.update!()
end)
IO.inspect(tracks)
Repo.update_all(Track, set: [number_of_plays: 0])

current_artist_count = Repo.aggregate(Artist, :count, :id)
artist_records = [
  %{
    "name" => "Shirley Horn",
    "birth_date" => ~D[1934-05-01],
    "death_date" => ~D[2005-10-20]
  }
]

artists =
  Enum.map(artist_records, fn artist ->
    %{name: artist["name"],
      birth_date: artist["birth_date"],
      death_date: artist["death_date"]}
  end)

Repo.insert_all(Artist, artists)
current_artist_count = Repo.aggregate(Artist, :count, :id)
artist_records = [
  %{
    "name" => "Shirley Horn",
    "birth_date" => ~D[1934-05-01],
    "death_date" => ~D[2005-10-20]
  }
]
#artists =
#  Enum.map(artist_records, fn artist ->
   %{name: artist["name"],
#  birth_date: artist["birth_date"],
#  death_date: artist["death_date"]}
#  end)
#  Repo.insert_all(Artist, artists)

#IO.inspect(artists)

#chunks = Enum.chunk_every(artist_records, 1000)
#Enum.each(chunks, fn chunk ->
#artists_chunk =
#Enum.map(chunk, fn artist ->
#%{name: artist["name"],
#birth_date: artist["birth_date"],
#death_date: artist["death_date"]}
#end)
#Repo.insert_all(Artist, artists_chunk)
#end)
#IO.inspect(chunks)
#stream =
#  Artist
#  |> Repo.stream()
#  |> Task.async_stream(fn artist ->
#  save_artist_record(artist)
#  end)
#  Repo.transaction(fn ->
#  Stream.run(stream)
#  end)
#IO.inspect(stream)
query = from(Artist, order_by: [:id])
chunk_size = 500
offset = 0
stream =
Stream.resource(
fn -> 0 end,
fn
:stop -> {:halt, :stop}
offset ->
rows =
Repo.all(from(query, limit: ^chunk_size, offset: ^offset))
if Enum.count(rows) < chunk_size do
{rows, :stop}
else
{rows, offset + chunk_size}
end
end,
fn _ -> :ok end
)
IO.inspect(query)
