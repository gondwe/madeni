defmodule Madeni.Loans.UserLoan do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user_loans" do

    field :user_id, :id
    field :loan_product_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user_loan, attrs) do
    user_loan
    |> cast(attrs, [])
    |> validate_required([])
  end
end
