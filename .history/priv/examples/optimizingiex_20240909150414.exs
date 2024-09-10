alias MusicDB.{
  Repo,
  Artist,
  Album,
  Track,
  Genre,
  Log
  }

album = Repo.get(Album, 1) |> Repo.preload(:tracks)
