defmodule MyApp.Repo.Migrations.AddSoldUnits do
  use Ecto.Migration
  def change do
  create table(:ratings) do
    add :sold_units, :integer, null: false, default: 0
    add :album_id, references(:albums, on_delete: :nothing)
    timestamps()
  end

  create index(:albums, :artist_id)
end
end
