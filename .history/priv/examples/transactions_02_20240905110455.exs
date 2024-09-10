
import ExUnit.Assertions
import ExUnit.CaptureIO

alias MusicDB.{Repo, Artist, Log}

result = capture_io(fn ->
  cs =
    %Artist{name: nil}
    |> Ecto.Changeset.change()
    |> Ecto.Changeset.validate_required([:name])
  Repo.transaction(fn ->
    case Repo.insert(cs) do
      {:ok, _artist} -> IO.puts("Artist insert succeeded")
      {:error, _value} -> IO.puts("Artist insert failed")
    end
    case Repo.insert(Log.changeset_for_insert(cs)) do
      {:ok, _log} -> IO.puts("Log insert succeeded")
      {:error, _value} -> IO.puts("Log insert failed")
    end
  end)
end)

assert "Artist insert failed\nLog insert succeeded\n" == result

result = (fn ->
  cs = Ecto.Changeset.change(%Artist{name: nil})
    |> Ecto.Changeset.validate_required([:name])
  Repo.transaction(fn ->
    case Repo.insert(cs) do
      {:ok, _artist} -> IO.puts("Artist insert succeeded")
      {:error, _value} -> Repo.rollback("Artist insert failed")
    end
    case Repo.insert(Log.changeset_for_insert(cs)) do
      {:ok, _log} -> IO.puts("Log insert succeeded")
      {:error, _value} -> Repo.rollback("Log insert failed")
    end
  end)
end).()

assert {:error, "Artist insert failed"} == result
