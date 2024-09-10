
defmodule MusicDB.AlbumWithEmbeds do
  use Ecto.Schema
  alias MusicDB.{ArtistEmbed, TrackEmbed}

  schema "albums_with_embeds" do
    field :title, :string
    embeds_one :artist, ArtistEmbed, on_replace: :update
    embeds_many :tracks, TrackEmbed, on_replace: :delete
  end
  def changeset(album, params) do
    album
    |> cast(params, [:title])
    |> validate_required([:title])
    |> cast_embed(:artist, with: &ArtistEmbed.changeset/2)
    |> cast_embed(:tracks, with: &TrackEmbed.changeset_list/2)
  end
end
