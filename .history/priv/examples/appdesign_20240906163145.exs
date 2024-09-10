defmodule MusicDB.Music do
  alias MusicDB.Music.{Repo, Album, Artist}
  def get_artist(name) do
  MusicDB.Repo.get_by(Artist, name: name)
  end
  def all_albums_by_artist(artist) do
  Ecto.assoc(artist, :albums)
  |> MusicDB.Repo.all()
  end
  def search_albums(string) do
  string
  |> Album.search()
  |> MusicDB.Repo.all()
  end
  end
