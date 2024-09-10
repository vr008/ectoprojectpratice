
import ExUnit.Assertions

import Ecto.Changeset
import Ecto.Query
alias Ecto.Changeset
alias MusicDB.{Repo, Artist}

import Ecto.Changeset

changeset = change(%Artist{name: "Charlie Parker"})

IO.inspect(changeset)
artist = Repo.get_by(Artist, name: "Bobby Hutcherson")
changeset = change(artist)

IO.inspect(changeset)

artist = Repo.get_by(Artist, name: "Bobby Hutcherson")
changeset = change(artist, name: "Robert Hutcherson")

IO.inspect(changeset)

changeset.changes

IO.inspect(changeset)

changeset = change(changeset, birth_date: ~D[1941-01-27])

IO.inspect(changeset)

artist = Repo.get_by(Artist, name: "Bobby Hutcherson")
changeset = change(artist, name: "Robert Hutcherson",
  birth_date: ~D[1941-01-27])

  IO.inspect(changeset)

changeset.changes

assert %{name: "Robert Hutcherson", birth_date: ~D[1941-01-27]} = changeset.changes
