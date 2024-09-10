config :music_db, ecto_repos: [MusicDB.Repo]

config :music_db, MusicDB.Repo, migration_lock: nil ,username: "postgres",
   password: "vig",
  database: "music_db",
  hostname: "localhost",
  port: 5432,
  pool_size: 10
