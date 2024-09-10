import Config

config :my_app, MyApp.Repo,
username: "postgres",
password: "vig",
database: "music_db",
hostname: "localhost",
port: 5432,
pool_size: 10
