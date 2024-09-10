use ExUnit.Case, async: true

test "valid changeset" do
 
  params = %{"title" => "Dark Side of the Moon"}
  changeset = Album.changeset(%Album{}, params)
  album = Repo.insert!(changeset)
  assert album.title == "Dark Side of the Moon"
  end
