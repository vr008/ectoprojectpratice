
defmodule ManyToManyAssociations1 do
  use Ecto.Schema

  # in album.ex
  schema "albums" do

    many_to_many :genres, MusicDB.Genre, join_through: MusicDB.AlbumGenre
  end
end

defmodule ManyToManyAssociations2 do
  use Ecto.Schema


  # in genre.ex
  schema "genres" do
    # field definitions here...

    many_to_many :albums, MusicDB.Album, join_through: MusicDB.AlbumGenre
  end
end

defmodule ManyToManyAssociations3 do
  use Ecto.Schema


  # in album_genre.ex
  schema "albums_genres" do
    # field definitions here...

    belongs_to :albums, MusicDB.Album
    belongs_to :genres, MusicDB.Genre
  end
end

defmodule ManyToManyAssociations4 do
  use Ecto.Schema

  # in album.ex
  schema "albums" do
    # field definitions here...

    many_to_many :genres, MusicDB.Genre, join_through: "albums_genres"
  end
end

defmodule ManyToManyAssociations5 do
  use Ecto.Schema


  # in genre.ex
  schema "genres" do
    # field definitions here...

    many_to_many :albums, MusicDB.Album, join_through: "albums_genres"
  end
end
