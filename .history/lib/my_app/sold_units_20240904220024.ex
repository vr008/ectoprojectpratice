defmodule MusicDB.SoldUnits do
  use Ecto.Schema
  alias MusicDB.SoldUnits

  schema "sold_units" do

    field(:number_of_plays, :integer)
    timestamps()

    belongs_to(:album, Album)
  end
end
