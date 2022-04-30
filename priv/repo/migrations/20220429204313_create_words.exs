defmodule Wordito.Repo.Migrations.CreateWords do
  use Ecto.Migration

  def change do
    create table(:words) do
      add :word, :string
      add :characters, :integer
      add :used_at, :utc_datetime

      timestamps()
    end
  end
end
