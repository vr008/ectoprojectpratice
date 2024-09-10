
import ExUnit.Assertions

import Ecto.Changeset
alias Ecto.Changeset
alias MusicDB.{Repo, Artist}

params = %{name: "Gene Harris"}
changeset =
  %Artist{}
  |> cast(params, [:name])
  |> validate_required([:name])

case Repo.insert(changeset) do
  {:ok, artist} -> IO.puts("Record for #{artist.name} was created.")
  {:error, changeset} -> IO.inspect(changeset.errors)
end

assert {:ok, _artist} = Repo.insert(changeset)

params = %{name: nil}
changeset =
  %Artist{}
  |> cast(params, [:name])
  |> validate_required([:name])

case Repo.insert(changeset) do
  {:ok, artist} -> IO.puts("Record for #{artist.name} was created.")
  {:error, changeset} -> IO.inspect(changeset.errors)
end

assert {:error, %Changeset{errors: [name: {"can't be blank", [validation: :required]}]}} = Repo.insert(changeset)
