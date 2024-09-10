
import ExUnit.Assertions

import Ecto.Query
alias Ecto.Query
alias MusicDB.Repo

defmodule ComposingQueriesExamples do
  def albums_by_artist(artist_name) do
    from a in "albums",
      join: ar in "artists", on: a.artist_id == ar.id,
      where: ar.name == ^artist_name
  end

  def call_first do

  albums_by_bobby = albums_by_artist("Bobby Hutcherson")
  end

  def by_artist(query, artist_name) do
    from a in query,
      join: ar in "artists", on: a.artist_id == ar.id,
      where: ar.name == ^artist_name
  end

  def call_second do

  albums_by_bobby = by_artist("albums", "Bobby Hutcherson")
  end

  def with_tracks_longer_than(query, duration) do
    from a in query,
      join: t in "tracks", on: t.album_id == a.id,
      where: t.duration > ^duration,
      distinct: true
  end

  def call_third do
    q =
      "albums"
      |> by_artist("Miles Davis")
      |> with_tracks_longer_than(720)
  end

  def title_only(query) do
    from a in query, select: a.title
  end

  def call_fourth do
  q =
    "albums"
    |> by_artist("Miles Davis")
    |> with_tracks_longer_than(720)
    |> title_only

  Repo.all(q)
  end

end


