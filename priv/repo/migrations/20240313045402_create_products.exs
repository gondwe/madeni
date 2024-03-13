defmodule Madeni.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :citext
      add :description, :text
      add :price, :decimal

      timestamps(type: :utc_datetime)
    end
  end
end
