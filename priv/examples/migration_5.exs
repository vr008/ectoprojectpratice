
alias MusicDB.Repo

defmodule MusicDB.Repo.Migrations.NoPrimaryKey do
  use Ecto.Migration

  def change do
    create table("compositions", primary_key: false) do
      add :title, :string, null: false
      #...
    end
  end
end

Ecto.Migrator.up(Repo, 1, MusicDB.Repo.Migrations.NoPrimaryKey)

defmodule MusicDB.Repo.Migrations.ExplicitPrimaryKey do
  use Ecto.Migration

  def change do
    create table("compositions", primary_key: false) do
      add :code, :string, primary_key: true
      #...
    end
  end
end

defmodule MusicDB.Repo.Migrations.ForeignKey do
  use Ecto.Migration

  def change do
    create table("compositions_artists") do
      add :composition_id, references("compositions",
        column: "code", type: "string")
      #...
    end
  end
end

Repo.query("drop table compositions")
Ecto.Migrator.up(Repo, 2, MusicDB.Repo.Migrations.ExplicitPrimaryKey)

defmodule MusicDB.Repo.Migrations.TimestampNames do
  use Ecto.Migration

  def change do
    create table("compositions") do
      timestamps(inserted_at: :created_at, updated_at: :changed_at,
        type: :utc_datetime)
      #...
    end
  end
end

Repo.query("drop table compositions")
Ecto.Migrator.up(Repo, 4, MusicDB.Repo.Migrations.TimestampNames)

defmodule MusicDB.Repo.Migrations.SkipTimestamp do
  use Ecto.Migration

  def change do
    create table("compositions") do
      timestamps updated_at: false
      #...
    end
  end
end

Repo.query("drop table compositions")
Ecto.Migrator.up(Repo, 5, MusicDB.Repo.Migrations.SkipTimestamp)

defmodule MusicDB.Repo.Migrations.AddCompositionsIndex do
  use Ecto.Migration
  @disable_ddl_transaction true

  def change do
    #...
  end
end

defmodule MusicDB.Repo.Migrations.AddTitle do
  use Ecto.Migration

  def change do
    alter table("compositions") do
      add :title, :string
    end
  end
end
Ecto.Migrator.up(Repo, 6, MusicDB.Repo.Migrations.AddTitle)

defmodule MusicDB.Repo.Migrations.AddCompositionsIndex do
  use Ecto.Migration
  @disable_ddl_transaction true

  def change do
    create index("composition", :title, concurrently: true)
  end
end

Ecto.Migrator.up(Repo, 7, MusicDB.Repo.Migrations.AddCompositionsIndex)
