defmodule MadeniWeb.LoanProductHTML do
  use MadeniWeb, :html

  embed_templates "loan_product_html/*"

  @doc """
  Renders a loan_product form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def loan_product_form(assigns)
end
