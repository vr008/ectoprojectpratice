import Config

config :my_app, MusicDB.Repo,
username: "postgres",
password: "vig",
database: "musicdb",
hostname: "localhost",
port: 5432,
pool_size: 10

config :my_app, :ecto_repos, [MusicDB.Repo]
