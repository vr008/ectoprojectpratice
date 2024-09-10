
import ExUnit.Assertions

alias MusicDB.Repo

if Repo.using_postgres?() do
  result =
  Repo.insert_all("artists", [%{name: "Max Roach"},
    %{name: "Art Blakey"}], returning: [:id, :name])

  assert {2, [%{}, %{}]} = result
end

result =
Ecto.Adapters.SQL.query(Repo, "select * from artists where id=1")


if Repo.using_postgres?() do
  assert {:ok, %Postgrex.Result{}} = result
else
  assert {:ok, %Mariaex.Result{}} = result
end

result =
Repo.query("select * from artists where id=1")

if Repo.using_postgres?() do
  assert {:ok, %Postgrex.Result{}} = result
else
  assert {:ok, %Mariaex.Result{}} = result
end
