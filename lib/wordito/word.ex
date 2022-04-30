defmodule Wordito.Word do
  use Ecto.Schema
  import Ecto.Changeset

  schema "words" do
    field :characters, :integer
    field :used_at, :utc_datetime
    field :word, :string

    timestamps()
  end

  @doc false
  def changeset(word, attrs) do
    word
    |> cast(attrs, [:word, :characters, :used_at])
    |> validate_required([:word, :characters, :used_at])
  end
end
