
alias MusicDB.Repo

defmodule MusicDB.Repo.Migrations.AddIndexesToCompositions do
  use Ecto.Migration

  def change do
    create index("compositions", :title)
    create index("compositions", :year)
  end
end

Ecto.Migrator.up(Repo, 1, MusicDB.Repo.Migrations.AddIndexesToCompositions)

defmodule MusicDB.Repo.Migrations.MiscIndexes do
  use Ecto.Migration

  def change do
    create index("compositions", [:title, :year])

    create index("genres", :name, unique: true)

    create unique_index("genres", :name)

    create index("compositions", :title, name: "title_index")
  end
end
