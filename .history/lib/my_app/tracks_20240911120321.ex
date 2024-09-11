
defmodule MusicDB.Track do
  use Ecto.Schema
  alias MusicDB.{Album,T

  schema "tracks" do
    field(:title, :string)
    field(:duration, :integer)
    field(:duration_string, :string, virtual: true)
    field(:index, :integer)
    field(:number_of_plays, :integer)
    timestamps()

    belongs_to(:album, Album)
    has_many(:artistfeedback,ArtistFeedback,on_replace: :nilify)

   # has_many :notes, MusicDB.Note
    #has_many :notes, {"notes_for_tracks", MusicDB.Note}, foreign_key: :assoc_id
    many_to_many :notes, MusicDB.Note, join_through: "tracks_notes"
  end
end
