
defmodule MusicDB.Artist do
  use Ecto.Schema
  import Ecto.Changeset
  alias MusicDB.{Artist, Album,Rating}

  schema "artists" do
    field(:name)
    field(:birth_date, :date)
    field(:death_date, :date)
    timestamps()

    has_many(:albums, Album, on_replace: :nilify)
    has_many(:tracks, through: [:albums, :tracks])
    has_many(:ratings,Ratings,on_replace: :nilify)

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
  def changeset(artist, params) do
    artist
    |> cast(params, [:name, :birth_date, :death_date])
    |> validate_required([:name])
  end

  def changeset(%MusicDB.Band{} = band) do
    {:ok, birth_date} = Date.new(band.year_started, 1, 1)
    {:ok, death_date} = Date.new(band.year_ended, 12, 31)

    changeset(%Artist{
      name: band.name,
      birth_date: birth_date,
      death_date: death_date
    }, %{})
  end

  def changeset(%MusicDB.SoloArtist{} = solo_artist) do
    name =
      "#{solo_artist.name1} #{solo_artist.name2} #{solo_artist.name3}"
      |> String.trim()

    changeset(%Artist{
      name: name,
      birth_date: solo_artist.birth_date,
      death_date: solo_artist.death_date
    }, %{})
  end
end
