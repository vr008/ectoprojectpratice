
import ExUnit.Assertions

import Ecto.Query
alias Ecto.Query
alias MusicDB.Repo

albums_by_miles = from a in "albums",
  join: ar in "artists", on: a.artist_id == ar.id,
  where: ar.name == "Miles Davis"

IO.inspect(albums_by_miles)

album_query = from a in albums_by_miles, select: a.title


assert %Query{} = album_query

album_query = from a in albums_by_miles, select: a.title
Repo.all(album_query)

assert MapSet.new(["Cookin' At The Plugged Nickel", "Kind Of Blue"]) == MapSet.new(Repo.all(album_query))

albums_by_miles = from a in "albums",
  join: ar in "artists", on: a.artist_id == ar.id,
  where: ar.name == "Miles Davis"

assert %Query{} = albums_by_miles

album_query = from [a,ar] in albums_by_miles, select: a.title

assert %Query{} = album_query

album_query = from [ar,a] in albums_by_miles, select: a.title

assert %Query{} = album_query

album_query = from albums in albums_by_miles, select: albums.title

assert %Query{} = album_query

track_query = from a in albums_by_miles,
  join: t in "tracks", on: a.id == t.album_id,
  select: t.title

assert %Query{} = track_query

albums_by_miles = from a in "albums",
  join: ar in "artists", on: a.artist_id == ar.id,
  where: ar.name == "Miles Davis"

album_query = from a in albums_by_miles, select: a.title
miles_albums = Repo.all(album_query)

track_query = from a in albums_by_miles,
  join: t in "tracks", on: a.id == t.album_id,
  select: t.title
miles_tracks = Repo.all(track_query)

albums_by_miles = from a in "albums", as: :albums,
  join: ar in "artists", as: :artists,
  on: a.artist_id == ar.id, where: ar.name == "Miles Davis"

assert %Query{} = albums_by_miles

assert_raise(Ecto.Query.CompileError, fn ->
  ast = quote do

    albums_by_miles = from a in "albums", as: "albums",
      join: ar in "artists", as: "artists",
      on: a.artist_id == ar.id, where: ar.name == "Miles Davis"
    #=> ** (Ecto.Query.CompileError) `as` must be a compile time atom...

  end
  Code.eval_quoted(ast, [], __ENV__)
end)

album_query = from [albums: a] in albums_by_miles, select: a.title

assert %Query{} = album_query

album_query = from [artists: ar, albums: a] in albums_by_miles,
  select: [a.title, ar.name]

assert %Query{} = album_query

albums_by_miles = from a in "albums", as: :albums,
  join: ar in "artists", as: :artists,
  on: a.artist_id == ar.id, where: ar.name == "Miles Davis"
has_named_binding?(albums_by_miles, :albums)
#=> true

assert has_named_binding?(albums_by_miles, :albums) == true
