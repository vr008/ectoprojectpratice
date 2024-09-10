
#alias MusicDB.Repo
#Repo.insert_all("genres", [[name: "ska", wiki_tag: "Ska_music"]])
#Repo.insert_all("ratings", [[rating: 10]])
alias MusicDB.{Repo, Rating, Artist}

# Assuming an artist already exists in the database
artist = Repo.get(Artist, artist_id)

# Creating a new rating and associating it with the artist
changeset = Rating.changeset(%Rating{}, %{rating: 5, artist_id: artist.id})

# Inserting the record into the database
case Repo.insert(changeset) do
  {:ok, rating} ->
    IO.puts("Rating inserted successfully: #{rating.id}")
  {:error, changeset} ->
    IO.inspect(changeset.errors)
end

