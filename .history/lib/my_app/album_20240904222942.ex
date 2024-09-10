
alias MusicDB.Track
import ExUnit.Assertions

import Ecto.Changeset
import Ecto.Query
alias MusicDB.{Repo, Artist, Album, Genre,Track}
defmodule MusicDB.Album do
  use Ecto.Schema


  schema "albums" do
    field(:title, :string)
    timestamps()

    belongs_to(:artist, Artist)
    has_many :tracks, Track,on_replace: :nilify
    #has_many :albums, Album, on_replace: :nilify
    has_many :album, Album,on_replace: :nilify
    has_many 


    many_to_many(:genres, Genre, join_through: "albums_genres")
  end
  def changeset(album, params) do
    album
    |> cast(params, [:title])
    |> validate_required([:title])
  end


end
