alias MusicDB.Repo
alias MusicDB.Genre
genre = %Genre{name: "funk", wiki_tag: "Funk"}
Repo.insert(genre)
