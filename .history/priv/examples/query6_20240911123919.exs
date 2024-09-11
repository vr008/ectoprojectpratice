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

import Ecto.Query

# First query (tracks with excellent feedback)
query1 = from t in Track,
  join: tf in TrackFeedback, on: tf.track_id == t.id,
  where: tf.type == "excellent",
  select: %{title: t.title, feedback: tf.type}

# Second query (tracks with good feedback)
query2 = from t in Track,
  join: tf in TrackFeedback, on: tf.track_id == t.id,
  where: tf.type == "good",
  select: %{title: t.title, feedback: tf.type}

# Union the queries
combined_query = union_all(query1, query2)

Repo.all(combined_query)
