
defmodule MusicDB.SoloArtist do
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field :name1, :string
    field :name2, :string
    field :name3, :string
    field :birth_date, :date
    field :death_date, :date
  end

  def changeset(solo_artist, params) do
    solo_artist
    |> cast(params, [:name1, :name2, :name3, :birth_date, :death_date])
    |> validate_required([:name1, :name2, :name3, :birth_date, :death_date])
    |> validate_date_order(:birth_date, :death_date)
  end

  def validate_date_order(changeset, _field1, _field2) do
    changeset
  end

  #def to_artist(solo_artist) do
   # name =
      "#{solo_artist.name1} #{solo_artist.name2} #{solo_artist.name3}"
      |> String.trim()

    %{name: name, birth_date: solo_artist.birth_date,
      death_date: solo_artist.death_date}
  end
end
