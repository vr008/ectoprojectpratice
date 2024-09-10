import Config

config :my_app, MusicDB.Repo,types: MyApp.PostgrexTypes
# ]pool: Ecto.Adapters.SQL.Sandbox,types: MyApp.PostgrexTypes,
username: "postgres",
password: "vig",
database: "musicdb",
hostname: "localhost",
port: 5432,
pool_size: 10

config :my_app, :ecto_repos, [MusicDB.Repo]
