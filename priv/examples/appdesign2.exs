defmodule Forum.Post do
  use Ecto.Schema
  import Ecto.Query
  # ...
  def from_user(user_or_users) do
  # assoc() can take a single schema or a list - we'll do the same
  user_ids = user_or_users |> List.wrap() |> Enum.map(& &1.id)
  from p in Post,
  where: p.user_id in ^user_ids
  end
  end
