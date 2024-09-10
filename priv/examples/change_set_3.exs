
import ExUnit.Assertions

import Ecto.Changeset
alias MusicDB.Artist

params = %{"name" => "Charlie Parker", "birth_date" => "1920-08-29",
  "instrument" => "alto sax"}

changeset = cast(%Artist{}, params, [:name, :birth_date])
changeset.changes

IO.inspect(changeset)

params = %{"name" => "Charlie Parker", "birth_date" => "NULL"}

params = %{"name" => "Charlie Parker", "birth_date" => "NULL"}
changeset = cast(%Artist{}, params, [:name, :birth_date],
  empty_values: ["", "NULL"])
changeset.changes

IO.inspect(changeset)
