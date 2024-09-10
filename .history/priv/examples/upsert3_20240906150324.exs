alias MusicDB.Repo
alias MusicDB.Genre
genre = %Genre{name: "funk", wiki_tag: "Funk"}
IO.inspect(Repo.insert(genre))
