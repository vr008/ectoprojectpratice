
alias MusicDB.Track
import ExUnit.Assertions

import Ecto.Changeset
import Ecto.Query
alias MusicDB.{Repo, Artist, Album, Genre}
defmodule MusicDB.Album do
  use Ecto.Schema
  alias MusicDB.{Artist, Track, Genre}

  schema "albums" do
    field(:title, :string)
    timestamps()

    belongs_to(:artist, Artist)
    has_man: tracks, Track
    #has_many :albums, Album, on_replace: :nilify
    has_many :albums, Album,on_replace: :nilify


    many_to_many(:genres, Genre, join_through: "albums_genres")
  end
  def changeset(album, params) do
    album
    |> cast(params, [:title])
    |> validate_required([:title])
  end


end
