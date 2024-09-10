
use ExUnit.Case, async: true
alias MusicDB.Album
alias MusicDB.Repo
test "valid changeset" do

  params = %{"title" => "Dark Side of the Moon"}
  changeset = Album.changeset(%Album{}, params)
  album = Repo.insert!(changeset)
  assert album.title == "Dark Side of the Moon"
  end
