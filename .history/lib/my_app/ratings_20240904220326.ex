defmodule MusicDB.Rating do
  use Ecto.Schema
  alias MusicDB.Artist

  schema "ratings" do

    field(:rating, :integer)
    timestamps()

    belongs_to(:artists, Artist)
  end
end
