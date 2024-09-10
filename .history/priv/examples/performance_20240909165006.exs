
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
