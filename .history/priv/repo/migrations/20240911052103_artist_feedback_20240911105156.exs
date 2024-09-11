defmodule MusicDB.Repo.Migrations.ArtistFeedback do
  use Ecto.Migration

  def change do
    create table(:ratings) do
      add :rating, :integer, null: false, default: 0
      add :artist_id, references(:artists, on_delete: :nothing)
      timestamps()
    end

    create index(:ratings, :artist_id)

  end
end
