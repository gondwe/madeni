defmodule MadeniWeb.LoanProductHTML do
  use MadeniWeb, :html

  alias Madeni.Products
  alias Madeni.Loans

  embed_templates "loan_product_html/*"

  @doc """
  Renders a loan_product form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def loan_product_form(assigns)

  def loan_types_for_select() do
    Loans.list_loan_types()
    |> Enum.into(%{}, &{&1.name, &1.id})
  end

  def products_for_select() do
    Products.list_products()
    |> Enum.into(%{}, &{&1.name, &1.id})
  end
end
