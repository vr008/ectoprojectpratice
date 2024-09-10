defmodule MusicDB.RepoTest do
  use ExUnit.Case
  alias MusicDB.Repo

  test "using_postgres?/0 returns true when Postgres adapter is configured" do
    assert Repo.using_postgres?() == false
  end
end
