defmodule MadeniWeb.PaymentMethodHTML do
  use MadeniWeb, :html

  embed_templates "payment_method_html/*"

  @doc """
  Renders a payment_method form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def payment_method_form(assigns)
end
