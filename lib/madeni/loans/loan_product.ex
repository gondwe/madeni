defmodule Madeni.Loans.LoanProduct do
  use Ecto.Schema
  import Ecto.Changeset

  schema "loan_products" do
    field :description, :string
    field :interest_rate, :decimal
    field :loan_type_id, :id
    field :product_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(loan_product, attrs) do
    loan_product
    |> cast(attrs, [:description, :interest_rate])
    |> validate_required([:description, :interest_rate])
  end
end
