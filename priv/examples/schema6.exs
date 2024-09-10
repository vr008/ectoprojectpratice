
defmodule BelongsToAssociations do
  use Ecto.Schema

  schema "tracks" do
    field :title, :string

    belongs_to :album, MusicDB.Album
  end
end

defmodule BelongsToAssociations2 do
  use Ecto.Schema

  schema "albums" do

    has_many :tracks, MusicDB.Track
    belongs_to :artist, MusicDB.Artist
  end
end

defmodule BelongsToAssociations3 do
  use Ecto.Schema

  schema "artists" do

    has_many :albums, MusicDB.Album
  end

end
