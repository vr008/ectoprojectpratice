
import ExUnit.Assertions

alias MusicDB.{Repo, Artist, Album, Note}

defmodule MusicDB.Artist do
  use Ecto.Schema
  import Ecto.Changeset
  alias MusicDB.{Artist, Album}

  schema "artists" do
    field(:name)
    has_many(:albums, Album)
    has_many(:tracks, through: [:albums, :tracks])

    has_many :notes, MusicDB.Note
  end
end

result = (fn ->
  artist = Repo.get_by(Artist, name: "Bobby Hutcherson")
  note = Ecto.build_assoc(artist, :notes,
    note: "My fave vibes player", author: "darin")
  Repo.insert!(note)
  artist = Repo.preload(artist, :notes)
  artist.notes
  # => [
  #  %MusicDB.Note{
  #    ...
  #  }
  #]
end).()

assert [%Note{}] = result

defmodule MusicDB.Album do
  use Ecto.Schema

  schema "albums" do
    field(:title, :string)
    has_many :notes, MusicDB.Note
  end
end

result = (fn ->
  album = Repo.get_by(Album, title: "Kind Of Blue")
  note = Ecto.build_assoc(album, :notes,
    note: "Love this album!", author: "darin")
  Repo.insert!(note)
  album = Repo.preload(album, :notes)
  album.notes
  # => [
  #  %MusicDB.Note{
  #    ...
  #  }
  #]
end).()

assert [%Note{}] = result
