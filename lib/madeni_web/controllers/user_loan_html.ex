defmodule MadeniWeb.UserLoanHTML do
  use MadeniWeb, :html

  embed_templates "user_loan_html/*"

  @doc """
  Renders a user_loan form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def user_loan_form(assigns)
end
