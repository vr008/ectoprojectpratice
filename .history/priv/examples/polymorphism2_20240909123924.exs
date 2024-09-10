
alias MusicDB.{Repo, Album, Note}

defmodule MusicDB.Album do
  use Ecto.Schema

  schema "albums" do
    field(:title, :string)
    many_to_many :notes, MusicDB.Note, join_through: "albums_notes"
  end
end
