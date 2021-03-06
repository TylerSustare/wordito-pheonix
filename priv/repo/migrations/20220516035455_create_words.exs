defmodule Wordito.Repo.Migrations.CreateWords do
  use Ecto.Migration

  def change do
    create table(:words) do
      add :word, :string
      add :characters, :integer
      add :used_on, :naive_datetime

      timestamps()
    end
  end
end
