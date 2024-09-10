
defmodule BelongsToAssociations do
  use Ecto.Schema

  schema "tracks" do
    field :title, :string
    # other fields here...

    belongs_to :album, MusicDB.Album
  end
end

defmodule BelongsToAssociations2 do
  use Ecto.Schema

  # in album.ex
  schema "albums" do
    # field definitions here...

    has_many :tracks, MusicDB.Track
    belongs_to :artist, MusicDB.Artist
  end
end

defmodule BelongsToAssociations3 do
  use Ecto.Schema

  # in artist.ex
  schema "artists" do
    # field definitions here...

    has_many :albums, MusicDB.Album
  end

end
