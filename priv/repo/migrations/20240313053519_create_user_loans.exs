defmodule Madeni.Repo.Migrations.CreateUserLoans do
  use Ecto.Migration

  def change do
    create table(:user_loans) do
      add :user_id, references(:users, on_delete: :nothing)
      add :loan_product_id, references(:loan_products, on_delete: :restrict)
      add :payment_method_id, references(:payment_methods, on_delete: :restrict)

      timestamps(type: :utc_datetime)
    end

    create index(:user_loans, [:user_id])
    create index(:user_loans, [:loan_product_id])
    create index(:user_loans, [:payment_method_id])
  end
end
