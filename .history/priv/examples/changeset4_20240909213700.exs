
import ExUnit.Assertions

import Ecto.Changeset
alias MusicDB.Artist

params = %{"name" => "Thelonius Monk", "birth_date" => "1917-10-10"}
changeset =
  %Artist{}
  |> cast(params, [:name, :birth_date])
  |> validate_required([:name, :birth_date])
  |> validate_length(:name, min: 3)

assert changeset.valid?

params = %{"name" => "Thelonius Monk"}
changeset =
  %Artist{}
  |> cast(params, [:name, :birth_date])
  |> validate_required([:name, :birth_date])
  |> validate_length(:name, min: 3)

changeset.valid?
changeset.errors

refute changeset.valid?

params = %{"name" => "x"}
changeset =
  %Artist{}
  |> cast(params, [:name, :birth_date])
  |> validate_required([:name, :birth_date])
  |> validate_length(:name, min: 3)

changeset.errors


assert MapSet.new([:name, :birth_date]) == MapSet.new(Keyword.keys(changeset.errors))

result =
traverse_errors(changeset, fn {msg, opts} ->
  Enum.reduce(opts, msg, fn {key, value}, acc ->
    String.replace(acc, "%{#{key}}", to_string(value))
  end)
end)


assert %{birth_date: _birth_date, name: _name} = result
