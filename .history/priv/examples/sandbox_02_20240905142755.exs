defmodule Sandbox do
  alias Ecto.Adapters.SQL.Sandbox

use ExUnit.Case, async: true

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(MusicDB.Repo)
    Ecto.Adapters.SQL.Sandbox.mode(MusicDB.Repo, {:shared, self()})
    end
test "insert album" do
  task = Task.async(fn ->
  receive do
  :continue -> :ok
  end
  album = MusicDB.Repo.insert!(%MusicDB.Album{title: "Giant Steps"})
  album.id
  end)
  Ecto.Adapters.SQL.Sandbox.allow(MusicDB.Repo, self(), task.pid)
  send(task.pid, :continue)
  album_id = Task.await(task)
  assert MusicDB.Repo.get(MusicDB.Album, album_id).title == "Giant Steps"
  end
