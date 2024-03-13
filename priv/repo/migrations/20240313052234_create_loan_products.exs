defmodule Madeni.Repo.Migrations.CreateLoanProducts do
  use Ecto.Migration

  def change do
    create table(:loan_products) do
      add :description, :text
      add :interest_rate, :decimal, null: false
      add :loan_type_id, references(:loan_types, on_delete: :nothing)
      add :product_id, references(:products, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:loan_products, [:loan_type_id])
    create index(:loan_products, [:product_id])
  end
end
