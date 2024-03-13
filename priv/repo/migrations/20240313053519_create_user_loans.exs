defmodule Madeni.Repo.Migrations.CreateUserLoans do
  use Ecto.Migration

  def change do
    create table(:user_loans) do
      add :user_id, references(:users, on_delete: :nothing)
      add :loan_product_id, references(:loan_products, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:user_loans, [:user_id])
    create index(:user_loans, [:loan_product_id])
  end
end
