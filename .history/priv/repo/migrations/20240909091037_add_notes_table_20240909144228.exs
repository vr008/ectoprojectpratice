defmodule MusicDB.Repo.Migrations.AddNotesTable do
  use Ecto.Migration

  def change do
    create table(:notes_with_jois) do
      add :note, :text, null: false
      add :author, :string, null: false
      timestamps()
      end
  end
end
