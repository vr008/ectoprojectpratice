
defmodule MusicDB.AlbumWithEmbeds do
  use Ecto.Schema
  alias MusicDB.{ArtistEmbed, TrackEmbed}
  use Ecto.Schema
  import Ecto.Changeset
  alias Ecto.Changeset
  alias MusicDB.Log

  schema "albums_with_embeds" do
    field :title, :string
    embeds_one :artist, ArtistEmbed, on_replace: :update
    embeds_many :tracks, TrackEmbed, on_replace: :delete
  end
  def changeset(album, params) do
    album
    |> cast(params, [:title])
    |> validate_required([:title])

  end
end
