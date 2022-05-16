defmodule Wordito.Word do
  use Ecto.Schema
  import Ecto.Changeset

  schema "words" do
    field :characters, :integer
    field :used_on, :naive_datetime
    field :word, :string

    timestamps()
  end

  @doc false
  def changeset(word, attrs) do
    word
    |> cast(attrs, [:word, :characters, :used_on])
    |> validate_required([:word, :characters, :used_on])
  end
end
