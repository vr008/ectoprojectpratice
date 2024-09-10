defmodule MusicDB.R do
  use Ecto.Schema
  alias MusicDB.Artist

  schema "ratings" do

    field(:rating, :integer)
    timestamps()

    belongs_to(:album, Artist)
  end
end
