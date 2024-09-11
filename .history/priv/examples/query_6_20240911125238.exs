alias MusicDB.{Repo, Artist, Album, Track, Genre, SoldUnits, Rating, TrackFeedback, ArtistFeedback}
import Ecto.Query

blues_genre = Repo.insert!(%Genre{name: "blue", wiki_tag: "Blue"})
jazz_genre = Repo.insert!(%Genre{name: "jaz", wiki_tag: "Jazz"})


artist = Repo.get_by(Artist, name: "John Coltrane")
updated_artist = Ecto.Changeset.change(artist, name: "John William Coltrane")
Repo.update!(updated_artist)

query = from t in Track,
  join: a in Album, on: a.id == t.album_id,
  join: ar in Artist, on: ar.id == a.artist_id,
  where: t.duration > 400,
  select: %{track_title: t.title, album_title: a.title, artist_name: ar.name}

tracks = Repo.all(query)
IO.inspect(tracks)

query1 = from t in Track,
  join: tf in TrackFeedback, on: tf.track_id == t.id,
  where: tf.type == "excellent",
  select: %{title: t.title, feedback: tf.type}

query2 = from t in Track,
  join: tf in TrackFeedback, on: tf.track_id == t.id,
  where: tf.type == "good",
  select: %{title: t.title, feedback: tf.type},
  union_all: ^query1

  combined_query=Repo.all(query2)
feedback_results = Repo.all(combined_query)
IO.inspect(feedback_results)

update_query = from t in Track,
  join: a in Album, on: a.id == t.album_id,
  join: ar in Artist, on: ar.id == a.artist_id,
  where: ar.name == "John William Coltrane",
  update: [set: [duration: t.duration + 60]]

Repo.update_all(update_query, [])

delete_query = from t in Track,
  join: a in Album, on: a.id == t.album_id,
  where: a.title == "Blue Train"

Repo.delete_all(delete_query)

IO.puts "All operations completed successfully!"
