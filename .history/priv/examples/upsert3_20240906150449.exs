alias MusicDB.Repo
alias MusicDB.Genre
#genre = %Genre{name: "fun", wiki_tag: "Fun"}

IO.inspect(Repo.insert(genre))
