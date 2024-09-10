ExUnit.start()
defmodule MusicDB.AlbumTest do
use ExUnit.Case, async: true
alias MusicDB.Album
alias MusicDB.Repo
alias Ecto.Changeset
#test "valid changeset" do

 # params = %{"title" => "Dark Side of the Moon"}
 # changeset = Album.changeset(%Album{}, params)
 # album = Repo.insert!(changeset)
 # assert album.title == "Dark Side of the Moon"
 # end
# end
test "valid changeset without insert" do
  params = %{"title" => "Dark Side of the Moon"}
  changeset = Album.changeset(%Album{}, params)
  album = Ecto.Changeset.apply_changes(changeset)
  assert album.title == "Dark Side of the Moon"
  end

