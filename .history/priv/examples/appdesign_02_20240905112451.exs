
_ = """
def deps() do
  [{:music, in_umbrella: true}]
end
"""

defmodule Forum.Post do
  use Ecto.Schema

  schema "posts" do
    belongs_to :user, Accounts.User
  end
end

defmodule Accounts.User do
  use Ecto.Schema

  schema "user" do

  end
end

defmodule Forum.Post do
  use Ecto.Schema
  import Ecto.Query

  # ...

  def from_user(user_or_users) do
    user_ids = user_or_users |> List.wrap() |> Enum.map(& &1.id)
    from p in Post,
      where: p.user_id in ^user_ids
  end
end
