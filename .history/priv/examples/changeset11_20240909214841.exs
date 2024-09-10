
import ExUnit.Assertions

import Ecto.Changeset
import Ecto.Query
alias MusicDB.{Repo, Artist, Album}

assert_raise(UndefinedFunctionError, fn ->
params = %{"name" => "Esperanza Spalding",
  "albums" => [%{"title" => "Junjo"}]}
changeset =
  %Artist{}
  |> cast(params, [:name])
  |> cast_assoc(:albums)
changeset.changes
end)

defmodule MusicDB.Album do
  use Ecto.Schema
  import Ecto.Changeset
  alias MusicDB.{Artist, Track, Genre}

  schema "albums" do
    field(:title, :string)
    timestamps()

    belongs_to(:artist, Artist)
  end

  def changeset(album, params) do
    album
    |> cast(params, [:title])
    |> validate_required([:title])
  end
end

params = %{"name" => "Esperanza Spalding",
  "albums" => [%{"title" => "Junjo"}]}
changeset =
  %Artist{}
  |> cast(params, [:name])
  |> cast_assoc(:albums)
changeset.changes


IO.inspect(changeset.changes)

artist = Repo.get_by(Artist, name: "Bill Evans")
  |> Repo.preload(:albums)
IO.inspect Enum.map(artist.albums, &({&1.id, &1.title}))


IO.inspect(MapSet.new(Enum.map(artist.albums, &({&1.id, &1.title}))))

portrait = Repo.get_by(Album, title: "Portrait In Jazz")
kind_of_blue = Repo.get_by(Album, title: "Kind Of Blue")
params = %{"albums" =>
  [
    %{"title" => "Explorations"},
    %{"title" => "Portrait In Jazz (remastered)", "id" => portrait.id},
    %{"title" => "Kind Of Blue", "id" => kind_of_blue.id}
  ]
}

defmodule MusicDB.Artist do
  use Ecto.Schema
  import Ecto.Changeset
  alias MusicDB.{Artist, Album}

  schema "artists" do
    field(:name)
    field(:birth_date, :date)
    field(:death_date, :date)
    timestamps()

    has_many(:albums, Album, on_replace: :nilify)
    has_many(:tracks, through: [:albums, :tracks])
  end

  def changeset(artist, params) do
    artist
    |> cast(params, [:name, :birth_date, :death_date])
    |> validate_required([:name])
  end
end

portrait = Repo.get_by(Album, title: "Portrait In Jazz")
kind_of_blue = Repo.get_by(Album, title: "Kind Of Blue")
params = %{"albums" =>
  [
    %{"title" => "Exploration"},
    %{"title" => "Portrait In Jazz (remastered)", "id" => portrait.id},
    %{"title" => "Kind Of Blue", "id" => kind_of_blue.id}
  ]
}

artist = Repo.get_by(Artist, name: "Bill Evans")
  |> Repo.preload(:albums)
{:ok, artist} =
  artist
  |> cast(params, [])
  |> cast_assoc(:albums)
  |> Repo.update
Enum.map(artist.albums, &({&1.id, &1.title}))

IO.inspect(MapSet.new(Enum.map(artist.albums, &({&1.id, &1.title}))))


result =
Repo.all(from a in Album, where: a.title == "Kind Of Blue")
|> Enum.map(&({&1.id, &1.title}))

IO.inspect(MapSet.new(result))

result =
Repo.all(from a in Album, where: a.title == "You Must Believe In Spring")
|> Enum.map(&({&1.id, &1.title, &1.artist_id}))

assert MapSet.new([{3, "You Must Believe In Spring", nil}]) == MapSet.new(result)
