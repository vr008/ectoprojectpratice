defmodule SearchEngineTest do
  use ExUnit.Case, async: true
  alias SearchEngine

  describe "update!/1" do
    test "updates item and returns :ok tuple" do
      item = %{name: "Test Item"}
      assert {:ok, item} = SearchEngine.update!(item)
    end
  end

  describe "update/1" do
    test "updates item and returns :ok tuple" do
      item = %{name: "Test Item"}
      assert {:ok, item} = SearchEngine.update(item)
    end
  end

  describe "update/3" do
    test "updates item with changes and extra argument and returns :ok tuple" do
      changes = %{name: "Updated Item"}
      extra_argument = :some_extra_argument
      repo = nil # Assuming _repo is not used in the function

      assert {:ok, {changes, extra_argument}} = SearchEngine.update(repo, changes, extra_argument)
    end
  end
end
