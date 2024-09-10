
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
    has_many(:ratings,Rating,on_replace: :nilify)

  end


  def changeset(artist, params) do
    artist
    |> cast(params, [:name, :birth_date, :death_date])
    |> validate_required([:name,:birth_date,:death_date])
    |> validate_birth_date()
    |> validate_birth_day()
    |> unique_constraint(:id)
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

  #def validate_birth_date(changeset) do
  #  case get_field(changeset, :birth_date) do
  #    %Date{month: month} when month in 1..12 ->
  #      changeset
  #    _ ->
  #      add_error(changeset, :birth_date, "month must be between 1 and 12")
  #  end
  #end
  #def validate_birth_day(changeset) do
  #  case get_field(changeset, :birth_date) do
  #    %Date{day: day} when day in 1..31 ->
  #      changeset
  #    _ ->
  #      add_error(changeset, :birth_date, "day must be between 1 and 31")
    end
  end
end
