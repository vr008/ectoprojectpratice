
defmodule MusicDB.Log do
 
  schema "logs" do
    field(:operation, :string)
    field(:item, :map)
    field(:changes, :map)
    timestamps()
  end

  def changeset_for_insert(%Changeset{} = changeset) do
    change(%Log{operation: "insert", item: serialize_schema(changeset.data)})
  end

  def changeset_for_insert(%{__meta__: %Ecto.Schema.Metadata{}} = item) do
    change(%Log{operation: "insert", item: serialize_schema(item)})
  end

  def changeset_for_insert(_other) do
    raise "changeset_for_insert can only accept a schema struct or a changeset"
  end

  def serialize_schema(schema) do
    schema.__struct__.__schema__(:fields)
    |> Enum.reduce(%{}, fn field, acc ->
      Map.put(acc, field, Map.get(schema, field))
    end)
  end
end
