defmodule MusicDB.Repo.Migrations.AlbumFeedback do
  use Ecto.Migration

  defmodule MusicDB.Repo.Migrations.ArtistFeedback do
    use Ecto.Migration

    def change do
      create table(:track_feedback) do
        add :type, :string, null: false
        add :detailedfeedback, :string,null: false
        add :track_id, references(:tracks, on_delete: :nothing)
        timestamps()
      end

      create index(:feedback, :track_id)

    end
  end

end
