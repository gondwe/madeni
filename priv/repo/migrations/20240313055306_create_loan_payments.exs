defmodule Madeni.Repo.Migrations.CreateLoanPayments do
  use Ecto.Migration

  def change do
    create table(:loan_payments) do
      add :amount, :decimal, null: false
      add :user_loan_id, references(:user_loans, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:loan_payments, [:user_loan_id])
  end
end
