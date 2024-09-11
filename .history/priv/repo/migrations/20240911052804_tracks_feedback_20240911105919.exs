defmodule MusicDB.Repo.Migrations.AlbumFeedback do
  use Ecto.Migration

  defmodule MusicDB.Repo.Migrations.ArtistFeedback do
    use Ecto.Migration

    def change do
      create table(:feedback) do
        add :type, :string, null: false
        add :detailedfeedback, :string,null: false
        add :album_id, references(:albums, on_delete: :nothing)
        timestamps()
      end

      create index(:feedback, :album_id)

    end
  end

end
