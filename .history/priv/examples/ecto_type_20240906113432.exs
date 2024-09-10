defmodule Ecto.Type do
  @callback type() :: Ecto.Type.t()
  @callback cast(term) :: {:ok, term} | {:error, keyword()} | :error
  @callback load(term) :: {:ok, term} | :error
  @callback dump(term) :: {:ok, term} | :error
  @callback equal?(term, term) :: boolean
  end

  defmodule MusicDB.DateTimeUnix do
    @behaviour Ecto.Type
    def type(), do: :datetime
    def dump(term), do: Ecto.Type.dump(:datetime, term)
    def load(term), do: Ecto.Type.load(:datetime, term)
    end
