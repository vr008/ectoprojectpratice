
defmodule MusicDB.Track do
  defstruct [:id, :title, :duration, :index, :number_of_plays]
end

defmodule MusicDB.Track do
  use Ecto.Schema

  schema "tracks" do
    field :title, :string
    field :duration, :integer
    field :index, :integer
    field :number_of_plays, :integer
    timestamps()
  end

end

defmodule SchemaExample do
  use Ecto.Schema
  schema "examples" do
    field :track_id, :id, primary_key: true
  end
end
