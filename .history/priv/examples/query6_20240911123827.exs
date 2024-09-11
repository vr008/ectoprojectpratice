new_artist = %Artist{name: "Miles Davis"}
Repo.insert!(new_artist)
artist = Repo.get_by(Artist, name: "Miles Davis")

# Create a changeset and update the name
changeset = Ecto.Changeset.change(artist, name: "Miles Dewey Davis III")

# Update the artist in the database
Repo.update!(changeset)
