alias MusicDB.Repo
alias MusicDB.Genre
genre = %Genre{name: "funk", wiki_tag: "Funky_stuff"}
#Repo.insert(genre, on_conflict: :replace_all_except_primary_key,conflict_target: :name)
Repo.insert_all(Rating, ratings, on_conflict: [set: [rating: 5]], conflict_target: :artist_id)

