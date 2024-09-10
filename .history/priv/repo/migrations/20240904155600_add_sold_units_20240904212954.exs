defmodule MyApp.Repo.Migrations.AddSoldUnits do
  use Ecto.Migration
  def change do
  create table(:ratings) do
    add :sold, :integer, null: false, default: 0
    add :artist_id, references(:artists, on_delete: :nothing)
    timestamps()
  end

  create index(:albums, :artist_id)
end
end
