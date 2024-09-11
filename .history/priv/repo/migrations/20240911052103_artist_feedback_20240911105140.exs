defmodule MusicDB.Repo.Migrations.ArtistFeedback do
  use Ecto.Migration

  def change do
    add :artist_id, references(:artists, on_delete: :nothing)

  end
end
