defmodule MusicDB.LogTest do
  use ExUnit.Case, async: true
  alias MusicDB.{Log, Album, Repo}

  describe "changeset_for_insert/1" do
    test "accepts a changeset" do
      album = %Album{title: "Test Album"}
      changeset = Album.changeset(album, %{})
      log_changeset = Log.changeset_for_insert(changeset)

      assert log_changeset.data.operation == "insert"
      assert log_changeset.data.item == %{title: "Test Album", artist_id: nil, id: nil, inserted_at: nil, updated_at: nil}
    end

    test "accepts a schema struct" do
      album = %Album{title: "Test Album"}
      log_changeset = Log.changeset_for_insert(album)

      assert log_changeset.data.operation == "insert"
      assert log_changeset.data.item == %{title: "Test Album", artist_id: nil, id: nil, inserted_at: nil, updated_at: nil}
    end

    test "raises error for invalid input" do
      assert_raise "changeset_for_insert can only accept a schema struct or a changeset", fn ->

        Log.changeset_for_insert("invalid input")
     # end
    #end
  end

    test "serializes a schema struct" do
      album = %Album{title: "Test Album"}
      serialized = Log.serialize_schema(album)

      assert serialized == %{title: "Test Album", artist_id: nil, id: nil, inserted_at: nil, updated_at: nil}
    end
end
