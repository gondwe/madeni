defmodule Madeni.LoansFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Madeni.Loans` context.
  """

  @doc """
  Generate a loan_type.
  """
  def loan_type_fixture(attrs \\ %{}) do
    {:ok, loan_type} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name",
        rate: "120.5"
      })
      |> Madeni.Loans.create_loan_type()

    loan_type
  end

  @doc """
  Generate a loan_product.
  """
  def loan_product_fixture(attrs \\ %{}) do
    {:ok, loan_product} =
      attrs
      |> Enum.into(%{
        description: "some description",
        interest_rate: "120.5"
      })
      |> Madeni.Loans.create_loan_product()

    loan_product
  end
end
