import ExUnit.Assertions

import Ecto.Changeset
import Ecto.Query
alias MusicDB.{Repo, Artist, Album}
defmodule MusicDB.Practice do
  def insert do
    params = %{name: "Gene Harris"}
    changeset =%Artist{}|> cast(params, [:name])
    |> validate_required([:name])
    case Repo.insert(changeset) do
      {:ok, artist} -> IO.puts("Record for #{artist.name} was created.")
      {:error, changeset} -> IO.inspect(changeset.errors)
    end
  end
end
