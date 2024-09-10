defmodule MyApp.Repo.Migrations.AddCompostionArtists do
  use Ecto.Migration

  use Ecto.Migration
  import Ecto.Query
  alias MusicDB.Repo
  def change do
  create table("compositions_artists") do
  add(:composition_id, references("compositions"), null: false)
  add(:artist_id, references("artists"), null: false)
  add(:role, :string, null: false)
  end
  create(index("compositions_artists", :composition_id))
  create(index("compositions_artists", :artist_id))
end
