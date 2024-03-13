defmodule Madeni.Repo.Migrations.CreateLoanTypes do
  use Ecto.Migration

  def change do
    create table(:loan_types) do
      add :name, :citext, null: false
      add :rate, :decimal, null: false
      add :description, :text

      timestamps(type: :utc_datetime)
    end
  end
end
