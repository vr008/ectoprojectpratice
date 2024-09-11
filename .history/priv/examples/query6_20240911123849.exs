new_artist = %Artist{name: "Miles Davis"}
Repo.insert!(new_artist)
artist = Repo.get_by(Artist, name: "Miles Davis")

changeset = Ecto.Changeset.change(artist, name: "Miles Dewey Davis III")

Repo.update!(changeset)

# Fetch artist
artist = Repo.get_by(Artist, name: "Chick Corea")

# Delete the artist
Repo.delete!(artist)

