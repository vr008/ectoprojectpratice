defmodule MusicDB.SoldUnits do
  use Ecto.Schema
  alias MusicDB.SoldUnits
  alias

  schema "sold_units" do

    field(:sold_units, :integer)
    timestamps()

    belongs_to(:albums, Album)
  end
end
