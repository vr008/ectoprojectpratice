defmodule MyApp.Repo.Migrations.AddArtists do
  use Ecto.Migration

  def change do
    reate table(:ratings) do
      add :rating, :integer, null: false, default: 0
      add :artist_id, references(:artists, on_delete: :nothing)
      timestamps()
    end

    create index(:albums, :artist_id)

  end
end
