defmodule MusicDB.Rating do
  use Ecto.Schema
  alias MusicDB.Artist

  schema "ratings" do

    field(:rating, :integer)
    timestamps()

    belongs_to(:artist, Artist)
  end
end
