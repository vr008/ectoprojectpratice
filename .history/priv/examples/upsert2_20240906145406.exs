alias MusicDB.Repo

#Repo.insert_all("genres", [[name: "ska", wiki_tag: "Ska_music"]],on_conflict: :nothing)

#Repo.insert_all("genres", [[name: "ska", wiki_tag: "Ska"]],on_conflict: {:replace, [:wiki_tag]}, returning: [:wiki_tag])
#Repo.insert_all("genres", [[name: "ska", wiki_tag: "Ska"]],
#on_conflict: {:replace, [:wiki_tag]}, conflict_target: :name,
returning: [:wiki_tag])
