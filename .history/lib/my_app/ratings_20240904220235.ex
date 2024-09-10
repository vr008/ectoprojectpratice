defmodule MusicDB.Track do
  use Ecto.Schema
  alias MusicDB.Album

  schema "ratings" do

    field(:rating, :integer)
    timestamps()

    belongs_to(:album, )
  end
end
