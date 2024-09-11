# Assuming necessary aliases are already in place:
alias MusicDB.{Repo, Artist, Album, Track, Genre, SoldUnits, Rating, TrackFeedback, ArtistFeedback}
import Ecto.Query

# Inserting new data
blues_genre = Repo.insert!(%Genre{name: "blues", wiki_tag: "Blues"})
jazz_genre = Repo.insert!(%Genre{name: "jazz", wiki_tag: "Jazz"})

john_coltrane = Repo.insert! %Artist{
  name: "John Coltrane",
  albums: [
    %Album{
      title: "Blue Train",
      genres: [blues_genre],
      tracks: [
        %Track{
          title: "Blue Train",
          duration: 500,
          index: 1,
          track_feedback: [%TrackFeedback{type: "excellent", detailedfeedback: "Iconic blues track."}]
        },
        %Track{
          title: "Locomotion",
          duration: 410,
          index: 2,
          track_feedback: [%TrackFeedback{type: "good", detailedfeedback: "Fast-paced and exciting."}]
        }
      ],
      sold_unit: [%SoldUnits{sold_units: 1000}]
    }
  ],
  ratings: [%Rating{rating: 10}],
  artist_feedback: [%ArtistFeedback{type: "excellent", detailedfeedback: "One of the best saxophonists of all time."}]
}

# Updating existing data
artist = Repo.get_by(Artist, name: "John Coltrane")
updated_artist = Ecto.Changeset.change(artist, name: "John William Coltrane")
Repo.update!(updated_artist)

# Joining tables and fetching data
query = from t in Track,
  join: a in Album, on: a.id == t.album_id,
  join: ar in Artist, on: ar.id == a.artist_id,
  where: t.duration > 400, # Filter tracks by duration
  select: %{track_title: t.title, album_title: a.title, artist_name: ar.name}

tracks = Repo.all(query)
IO.inspect(tracks)

# Union query example - combining feedback types "excellent" and "good"
query1 = from t in Track,
  join: tf in TrackFeedback, on: tf.track_id == t.id,
  where: tf.type == "excellent",
  select: %{title: t.title, feedback: tf.type}

query2 = from t in Track,
  join: tf in TrackFeedback, on: tf.track_id == t.id,
  where: tf.type == "good",
  select: %{title: t.title, feedback: tf.type}

combined_query = union_all(query1, query2)
feedback_results = Repo.all(combined_query)
IO.inspect(feedback_results)

update_query = from t in Track,
  join: a in Album, on: a.id == t.album_id,
  join: ar in Artist, on: ar.id == a.artist_id,
  where: ar.name == "John William Coltrane",
  update: [set: [duration: t.duration + 60]] # Add 60 seconds to each track

Repo.update_all(update_query, [])

delete_query = from t in Track,
  join: a in Album, on: a.id == t.album_id,
  where: a.title == "Blue Train"

Repo.delete_all(delete_query)

IO.puts "All operations completed successfully!"
