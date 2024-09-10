
defmodule MusicDB.Note do
  use Ecto.Schema
  import Ecto.Changeset

  #schema "notes_with_fk_fields" do
  #  field(:note, :string)
  #  field(:author, :string)

  #  timestamps()
  #  belongs_to(:artist, MusicDB.Artist)
  #  belongs_to(:album, MusicDB.Album)
  #  belongs_to(:track, MusicDB.Track)
  #end

   # schema "abstract table: notes" do
    #  field :note, :string
    #  field :author, :string
    #  field :assoc_id, :integer
    #  timestamps()
    #  end


  def changeset(note, params) do
    note
    |> cast(params, [:note, :author, :artist_id, :album_id, :track_id])
    |> validate_required([:note, :author])
    |> check_constraint(:artist_id,
      name: "only_one_fk",
      message: "You must set only one foreign key: artist_id, album_id, or track_id"
    )
  end
end
