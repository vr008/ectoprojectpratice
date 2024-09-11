new_artist = %Artist{name: "Miles Davis"}
Repo.insert!(new_artist)
artist = Repo.get_by(Artist, name: "Miles Davis")

changeset = Ecto.Changeset.change(artist, name: "Miles Dewey Davis III")

Repo.update!(changeset)

artist = Repo.get_by(Artist, name: "Chick Corea")

Repo.delete!(artist)
import Ecto.Query

query = from t in Track,
  join: a in Album, on: a.id == t.album_id,
  join: ar in Artist, on: ar.id == a.artist_id,
  select: %{track_title: t.title, album_title: a.title, artist_name: ar.name}

Repo.all(query)

