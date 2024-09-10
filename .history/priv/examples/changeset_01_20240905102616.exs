
import ExUnit.Assertions

import Ecto.Changeset
alias MusicDB.{Repo, Artist}

import Ecto.Changeset

params = %{name: "Gene Harris"}
changeset =
  %Artist{}
  |> cast(params, [:name])
  |> validate_required([:name])

case Repo.insert(changeset) do
  {:ok, artist} -> IO.puts("Record for #{artist.name} was created.")
  {:error, changeset} -> IO.inspect(changeset.errors)
end

assert %Artist{name: "Gene Harris"} = Repo.get_by(Artist, name: "Gene Harris")
