
alias MusicDB.{Repo, Artist}

Repo.insert(%Artist{name: "Dizzy Gillespie"})

dizzy = Repo.get_by(Artist, name: "Dizzy Gillespie")

Repo.update(Ecto.Changeset.change(dizzy, name: "John Birks Gillespie"))

# retrieve it again
dizzy = Repo.get_by(Artist, name: "John Birks Gillespie")

# delete it
Repo.delete(dizzy)
