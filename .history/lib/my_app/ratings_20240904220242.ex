defmodule MusicDB.Track do
  use Ecto.Schema
  alias MusicDB.Ar

  schema "ratings" do

    field(:rating, :integer)
    timestamps()

    belongs_to(:album, Ar)
  end
end
