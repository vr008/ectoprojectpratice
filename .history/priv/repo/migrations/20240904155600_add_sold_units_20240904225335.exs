defmodule MyApp.Repo.Migrations.AddSoldUnits do
  use Ecto.Migration
  def change do
  create table(:sold_units) do
    add :sold_units, :integer, null: false, default: 0
    add :albums_id, references(:albums, on_delete: :nothing)
    timestamps()
  end

  create index(:sold_units, :album_id)
end
end
