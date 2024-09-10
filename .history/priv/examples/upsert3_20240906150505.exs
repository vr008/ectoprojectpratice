alias MusicDB.Repo
alias MusicDB.Genre
#genre = %Genre{name: "fun", wiki_tag: "Fun"}
IORepo.insert(genre, on_conflict: [set: [wiki_tag: "Funk_music"]],
conflict_target: :name)
#IO.inspect(Repo.insert(genre))
