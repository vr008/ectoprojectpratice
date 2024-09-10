defmodule MusicDB.SoldUnits do
  use Ecto.Schema
  alias MusicDB.SoldUnits
  alias M

  schema "sold_units" do

    field(:sold_units, :integer)
    timestamps()

    belongs_to(:albums, Album)
  end
end
