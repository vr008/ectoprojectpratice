alias MusicDB.Track
import ExUnit.Assertions
import Ecto.Changeset
import Ecto.Query
alias MusicDB.{Repo, Artist, Album, Genre,Track,SoldUnits}
defmodule MusicDB.Album do
  use Ecto.Schema
  schema "albums" do
    field(:title, :string)
    timestamps()
    belongs_to(:artist, Artist)
    has_many :tracks, Track,on_replace: :nilify
    has_many :album, Album,on_replace: :nilify
    has_many :sold_unit,SoldUnits,on_replace: :nilify
    many_to_many(:genres, Genre, join_through: "albums_genres")
  end
  @spec changeset(
          {map(),
           %{
             optional(atom()) =>
               atom()
               | {:array | :assoc | :embed | :in | :map | :parameterized | :supertype | :try,
                  any()}
           }}
          | %{
              :__struct__ => atom() | %{:__changeset__ => map(), optional(any()) => any()},
              optional(atom()) => any()
            },
          :invalid | %{optional(:__struct__) => none(), optional(atom() | binary()) => any()}
        ) :: Ecto.Changeset.t()
  def changeset(album, params) do
    album
    |> cast(params, [:title])
    |> validate_required([:title])
    |> foreign_key_constraint(:albums, name: "album_artist_id_fkey")

  end

end
