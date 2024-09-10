alias MusicDB.Repo
alias MusicDB.Genre
#genre = %Genre{name: "fun", wiki_tag: "Fun"}
Repo.insert(genre, on_conflict: [set: [wiki_tag: "Funk_music"]],
conflict_target: :name)
IO.inspect(Repo.insert(genre))
