alias MusicDB.Repo
alias MusicDB.Genre
alias MusicDB.Rating
genre = %Genre{name: "funk", wiki_tag: "Funky_stuff"}

Repo.insert(genre, on_conflict: :replace_all,conflict_target: :name)
