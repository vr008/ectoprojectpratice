config :my_app, :ecto_repos, [MyApp.Repo]

config :my_app, MyApp.Repo, migration_lock: nil ,username: "postgres",
   password: "vig",
  database: "musicdb",
  hostname: "localhost",
  port: 5432,
  pool_size: 10
