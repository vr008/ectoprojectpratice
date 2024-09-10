
import ExUnit.Assertions

alias MusicDB.Repo

result =
Repo.insert_all("artists", [[name: "John Coltrane"]])

assert {1, nil} = result

result =
Repo.insert_all("artists",
  [[name: "Sonny Rollins", inserted_at: DateTime.utc_now()]])

assert {1, nil} = result

result =
Repo.insert_all("artists",
  [[name: "Max Roach", inserted_at: DateTime.utc_now()],
  [name: "Art Blakey", inserted_at: DateTime.utc_now()]])
#=> {2, nil}

assert {2, nil} = result

result =
Repo.insert_all("artists",
  [%{name: "Max Roach", inserted_at: DateTime.utc_now()},
   %{name: "Art Blakey", inserted_at: DateTime.utc_now()}])
#=> {2, nil}

assert {2, nil} = result

result =
Repo.update_all("artists", set: [updated_at: DateTime.utc_now()])
#=> {9, nil}

assert {9, nil} = result

result =
Repo.delete_all("tracks")
#=> {33, nil}

assert {33, nil} = result
