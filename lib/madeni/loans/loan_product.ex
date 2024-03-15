defmodule Madeni.Loans.LoanProduct do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, only: [from: 2]

  alias Madeni.Loans.LoanType
  alias Madeni.Products.Product

  schema "loan_products" do
    field :description, :string
    field :interest_rate, :decimal

    belongs_to(:product, Product)
    belongs_to(:loan_type, LoanType)

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(loan_product, attrs) do
    loan_product
    |> cast(attrs, [:description, :interest_rate, :loan_type_id, :product_id])
    |> validate_required([:description, :interest_rate, :loan_type_id, :product_id])
  end

  def loan_product_query do
    from(lp in __MODULE__,
      left_join: p in assoc(lp, :product),
      left_join: lt in assoc(lp, :loan_type),
      preload: [product: p, loan_type: lt]
    )
  end
end
