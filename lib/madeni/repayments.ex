defmodule Madeni.Repayments do
  @moduledoc """
  The Repayments context.
  """

  import Ecto.Query, warn: false
  alias Madeni.Repo

  alias Madeni.Repayments.LoanPayment

  @doc """
  Returns the list of loan_payments.

  ## Examples

      iex> list_loan_payments()
      [%LoanPayment{}, ...]

  """
  def list_loan_payments do
    Repo.all(LoanPayment)
  end

  @doc """
  Gets a single loan_payment.

  Raises `Ecto.NoResultsError` if the Loan payment does not exist.

  ## Examples

      iex> get_loan_payment!(123)
      %LoanPayment{}

      iex> get_loan_payment!(456)
      ** (Ecto.NoResultsError)

  """
  def get_loan_payment!(id), do: Repo.get!(LoanPayment, id)

  @doc """
  Creates a loan_payment.

  ## Examples

      iex> create_loan_payment(%{field: value})
      {:ok, %LoanPayment{}}

      iex> create_loan_payment(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_loan_payment(attrs \\ %{}) do
    %LoanPayment{}
    |> LoanPayment.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a loan_payment.

  ## Examples

      iex> update_loan_payment(loan_payment, %{field: new_value})
      {:ok, %LoanPayment{}}

      iex> update_loan_payment(loan_payment, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_loan_payment(%LoanPayment{} = loan_payment, attrs) do
    loan_payment
    |> LoanPayment.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a loan_payment.

  ## Examples

      iex> delete_loan_payment(loan_payment)
      {:ok, %LoanPayment{}}

      iex> delete_loan_payment(loan_payment)
      {:error, %Ecto.Changeset{}}

  """
  def delete_loan_payment(%LoanPayment{} = loan_payment) do
    Repo.delete(loan_payment)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking loan_payment changes.

  ## Examples

      iex> change_loan_payment(loan_payment)
      %Ecto.Changeset{data: %LoanPayment{}}

  """
  def change_loan_payment(%LoanPayment{} = loan_payment, attrs \\ %{}) do
    LoanPayment.changeset(loan_payment, attrs)
  end
end
