
defmodule MusicDB.Album do
  use Ecto.Schema

  schema "albums" do
    field :title, :string
    field :release_date, :date
  end

end

defmodule MusicDB.Album do
  use Ecto.Schema

  schema "albums" do
    field :title, :string
    field :release_date, :date

    has_many :tracks, MusicDB.Track
  end

end

defmodule MusicDB.Album do
  use Ecto.Schema

  schema "albums" do
    field :title, :string
    field :release_date, :date

  has_many :tracks, MusicDB.Track, foreign_key: :album_number
  end

end
