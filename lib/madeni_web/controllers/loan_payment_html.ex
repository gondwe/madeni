defmodule MadeniWeb.LoanPaymentHTML do
  use MadeniWeb, :html

  embed_templates "loan_payment_html/*"

  @doc """
  Renders a loan_payment form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def loan_payment_form(assigns)
end
