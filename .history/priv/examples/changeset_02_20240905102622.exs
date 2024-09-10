
import ExUnit.Assertions

import Ecto.Changeset
import Ecto.Query
alias Ecto.Changeset
alias MusicDB.{Repo, Artist}

import Ecto.Changeset

changeset = change(%Artist{name: "Charlie Parker"})

assert %Changeset{} = changeset

artist = Repo.get_by(Artist, name: "Bobby Hutcherson")
changeset = change(artist)

assert %Changeset{} = changeset

artist = Repo.get_by(Artist, name: "Bobby Hutcherson")
changeset = change(artist, name: "Robert Hutcherson")

assert %Changeset{} = changeset

changeset.changes
#=> %{name: "Robert Hutcherson"}

assert %{name: "Robert Hutcherson"} = changeset.changes

changeset = change(changeset, birth_date: ~D[1941-01-27])

assert %{name: "Robert Hutcherson", birth_date: ~D[1941-01-27]} = changeset.changes

artist = Repo.get_by(Artist, name: "Bobby Hutcherson")
changeset = change(artist, name: "Robert Hutcherson",
  birth_date: ~D[1941-01-27])

assert %Changeset{} = changeset

changeset.changes
#=> %{birth_date: ~D[1941-01-27], name: "Robert Hutcherson"}

assert %{name: "Robert Hutcherson", birth_date: ~D[1941-01-27]} = changeset.changes
