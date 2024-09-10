
import ExUnit.Assertions

alias MusicDB.Repo

result =
Repo.insert_all("genres", [[name: "ska", wiki_tag: "Ska_music"]])

assert {1, nil} == result

if Repo.using_postgres?() do
  assert_raise(Postgrex.Error, fn ->
    Repo.insert_all("genres", [[name: "ska", wiki_tag: "Ska_music"]])

  end)
else
  assert_raise(Mariaex.Error, fn ->
    Repo.insert_all("genres", [[name: "ska", wiki_tag: "Ska_music"]])
  end)
end

result =
Repo.insert_all("genres", [[name: "ska", wiki_tag: "Ska_music"]],
  on_conflict: :nothing)

if Repo.using_postgres?() do
  assert {0, nil} == result
end

assert_raise(ArgumentError, fn ->
  Repo.insert_all("genres", [[name: "ska", wiki_tag: "Ska"]],
    on_conflict: {:replace, [:wiki_tag]}, returning: [:wiki_tag])

end)

if Repo.using_postgres?() do
  result =
  Repo.insert_all("genres", [[name: "ska", wiki_tag: "Ska"]],
    on_conflict: {:replace, [:wiki_tag]}, conflict_target: :name,
    returning: [:wiki_tag])
  # => {1, [%{wiki_tag: "Ska"}]}

  assert {1, [%{wiki_tag: "Ska"}]} == result

  result =
  Repo.insert_all("genres", [[name: "ambient", wiki_tag: "Ambient_music"]],
    on_conflict: {:replace, [:wiki_tag]}, conflict_target: :name,
    returning: [:wiki_tag])
  # => {1, [%{wiki_tag: "Ambient_music"}]}

  assert {1, [%{wiki_tag: "Ambient_music"}]} == result

  Repo.insert_all("genres", [[name: "ambient", wiki_tag: "Ambient_music"]],
    on_conflict: [set: [wiki_tag: "Ambient_music"]],
    conflict_target: :name, returning: [:wiki_tag])

  assert {1, [%{wiki_tag: "Ambient_music"}]} == result
end
