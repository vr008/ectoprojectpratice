
defmodule NestedAssociation do
  use Ecto.Schema

  schema "artists" do
    # field definitions here...

    has_many :albums, MusicDB.Album
    has_many :tracks, through: [:albums, :tracks]
  end
end
