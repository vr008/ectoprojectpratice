
import ExUnit.Assertions

import Ecto.Changeset
alias Ecto.Changeset
alias MusicDB.{Repo, Genre}

Repo.insert(%Genre{name: "speed polka"})

IO.inspect(Repo.get_by(Genre, name: "speed polka"))



Repo.insert!(%Genre{ name: "bebop" })

params = %{"name" => "bebop"}
changeset =
  %Genre{}
  |> cast(params, [:name])
  |> validate_required(:name)
  |> validate_length(:name, min: 3)
  |> unique_constraint(:name)
IO.inspect(changeset.errors)


params = %{"name" => "bebop"}
changeset =
  %Genre{}
  |> cast(params, [:name])
  |> validate_required(:name)
  |> validate_length(:name, min: 3)
  |> unique_constraint(:name)
case Repo.insert(changeset) do
  {:ok, _genre} -> IO.puts "Success!"
  {:error, changeset} -> IO.inspect changeset.errors
end
