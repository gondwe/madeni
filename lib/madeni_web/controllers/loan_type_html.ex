defmodule MadeniWeb.LoanTypeHTML do
  use MadeniWeb, :html

  embed_templates "loan_type_html/*"

  @doc """
  Renders a loan_type form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def loan_type_form(assigns)
end
