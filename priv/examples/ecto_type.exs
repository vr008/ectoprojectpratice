

  defmodule MusicDB.DateTimeUnix do
    @behaviour Ecto.Type
    def type(), do: :datetime
    def dump(term), do: Ecto.Type.dump(:datetime, term)
    def load(term), do: Ecto.Type.load(:datetime, term)
    end
