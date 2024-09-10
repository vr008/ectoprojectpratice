defmodule MyApp.Repo.Migrations.AddRatings do
  use Ecto.Migration

  def change do
    create table(:ratings) do
      add :title, :string, null: false
      add :artist_id, references(:artists, on_delete: :nothing)
      timestamps()
    end

    create index(:albums, :artist_id)

  end
end
