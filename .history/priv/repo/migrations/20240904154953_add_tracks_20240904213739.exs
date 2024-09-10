defmodule MyApp.Repo.Migrations.AddTracks do
  use Ecto.Migration

  create table(:tracks) do
    add :title, :string, null: false
    add :duration, :integer, null: true
    add :number_of_plays, :integer, null: false, default: 0
    add :album_id, references(:albums, on_delete: :nothing)
    timestamps()
  end

  create index(:tracks, :title)
  create index(:tracks, :album_id)
end
