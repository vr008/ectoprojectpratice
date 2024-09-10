defmodule MusicDB.Track do
  use Ecto.Schema
  alias MusicDB.Album

  schema "ratings" do

    field(:rating, :integer)
    field(:number_of_plays, :integer)
    timestamps()

    belongs_to(:album, Album)
  end
end
