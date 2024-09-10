config :my, :ecto_repos, [MyApp.Repo]

config :music_db, MyApp.Repo, migration_lock: nil ,username: "postgres",
   password: "vig",
  database: "music_db",
  hostname: "localhost",
  port: 5432,
  pool_size: 10
