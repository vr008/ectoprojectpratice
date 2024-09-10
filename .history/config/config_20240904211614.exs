import Config

config :my_app, MyApp.Repo,
username: "postgres",
password: "vig",
database: "musicdb",
hostname: "localhost",
port: 5432,
pool_size: 10

config :music_db, :ecto_repos, [MusicDB.Repo]
