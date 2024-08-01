defmodule Memex.Repo.Migrations.CreateMemes do
  use Ecto.Migration

  def change do
    create table(:memes) do
      add :name, :string
      add :link, :string
      add :description, :text

      timestamps(type: :utc_datetime)
    end
  end
end
