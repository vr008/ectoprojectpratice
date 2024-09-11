defmodule MusicDB.Repo.Migrations.ArtistFeedback do
  use Ecto.Migration

  def change do
    create table(:artist_feedback) do
      add :type, :string, null: false
      add :detailedfeedback, :string,null: false
      add :artist_id, references(:artists, on_delete: :nothing)
      timestamps()
    end

    create index(:feedback, :artist_id)

  end
end
