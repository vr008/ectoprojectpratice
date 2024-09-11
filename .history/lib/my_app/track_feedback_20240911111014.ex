
defmodule MusicDB.Track_Feedback do
  use Ecto.Schema
  import Ecto.Changeset
  alias MusicDB.Track

  schema "track_feedbacks" do
    field(:type)
    field(:detailedfeedback)

    timestamps()

    belongs_to(:tracks, Track)
  end
  @spec changeset(
          {map(),
           %{
             optional(atom()) =>
               atom()
               | {:array | :assoc | :embed | :in | :map | :parameterized | :supertype | :try,
                  any()}
           }}
          | %{
              :__struct__ => atom() | %{:__changeset__ => map(), optional(any()) => any()},
              optional(atom()) => any()
            },
          :invalid | %{optional(:__struct__) => none(), optional(atom() | binary()) => any()}
        ) :: Ecto.Changeset.t()
  def changeset(album_genre, params) do
    album_genre
    |> cast(params, [:type,:detailedfeedback])
    |> validate_required([:type,:detailedfeedback])
    |>unique_constraint(:id)
  end
end
