defmodule Madeni.RepaymentsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Madeni.Repayments` context.
  """

  @doc """
  Generate a loan_payment.
  """
  def loan_payment_fixture(attrs \\ %{}) do
    {:ok, loan_payment} =
      attrs
      |> Enum.into(%{
        amount: "120.5"
      })
      |> Madeni.Repayments.create_loan_payment()

    loan_payment
  end
end
