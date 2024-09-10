
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
#=> {:ok,
#=>  %Postgrex.Result{
#=>    columns: ["id", "name", "birth_date", "death_date", "inserted_at",
#=>     "updated_at"],
#=>    command: :select,
#=>    connection_id: 3333,
#=>    messages: [],
#=>    num_rows: 1,
#=>    rows: [
#=>      [1, "Miles Davis", nil, nil, ~N[2018-1-05 23:32:31.000000],
#=>       ~N[2018-1-05 23:32:31.000000]]
#=>    ]
#=>  }}

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
