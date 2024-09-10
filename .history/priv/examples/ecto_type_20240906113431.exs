defmodule Ecto.Type do
  @callback type() :: Ecto.Type.t()
  @callback cast(term) :: {:ok, term} | {:error, keyword()} | :error
  @callback load(term) :: {:ok, term} | :error
  @callback dump(term) :: {:ok, term} | :error
  @callback equal?(term, term) :: boolean
  end

  
