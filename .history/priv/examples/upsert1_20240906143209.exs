
alias MusicDB.Repo

#Repo.insert_all("genres", [[name: "ska", wiki_tag: "Ska_music"]])
#Repo.insert_all("ratings", [[rating: 10]])
Repo.insert_all(Rating, [
  %{rating: 5, artist_id: 1, inserted_at: NaiveDateTime.utc_now(), updated_at: NaiveDateTime.utc_now()},
  %{rating: 4, artist_id: 2, inserted_at: NaiveDateTime.utc_now(), updated_at: NaiveDateTime.utc_now()},
  %{rating: 3, artist_id: 1, inserted_at: NaiveDateTime.utc_now(), updated_at: NaiveDateTime.utc_now()}
])
