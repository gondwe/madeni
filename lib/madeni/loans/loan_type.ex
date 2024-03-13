defmodule Madeni.Loans.LoanType do
  use Ecto.Schema
  import Ecto.Changeset

  schema "loan_types" do
    field :name, :string
    field :description, :string
    field :rate, :decimal

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(loan_type, attrs) do
    loan_type
    |> cast(attrs, [:name, :rate, :description])
    |> validate_required([:name, :rate, :description])
  end
end
