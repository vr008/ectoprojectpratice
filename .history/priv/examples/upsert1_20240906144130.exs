
#alias MusicDB.Repo
#alias MusicDB.Rating
#Repo.insert_all("genres", [[name: "ska", wiki_tag: "Ska_music"]])
#Repo.insert_all("ratings", [[rating: 10]])
alias MusicDB.Repo
alias MusicDB.Rating
import NaiveDateTime

# Get the current time without microseconds
now = utc_now() |> truncate(:second)

# Inserting multiple ratings
#Repo.insert_all(Rating, [
#  %{rating: 5, artist_id: 1, inserted_at: now, updated_at: now},
#  %{rating: 4, artist_id: 2, inserted_at: now, updated_at: now},
#  %{rating: 3, artist_id: 1, inserted_at: now, updated_at: now}
#])
Repo.insert_all("ratings",[[rating: 10,artist_id: 1,inserted_at:]])
