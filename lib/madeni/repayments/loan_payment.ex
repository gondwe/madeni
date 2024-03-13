defmodule Madeni.Repayments.LoanPayment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "loan_payments" do
    field :amount, :decimal
    field :user_loan_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(loan_payment, attrs) do
    loan_payment
    |> cast(attrs, [:amount, :user_loan_id])
    |> validate_required([:amount, :user_loan_id])
  end
end
