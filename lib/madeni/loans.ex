defmodule Madeni.Loans do
  @moduledoc """
  The Loans context.
  """

  import Ecto.Query, warn: false
  alias Madeni.Repo

  alias Madeni.Loans.LoanType

  @doc """
  Returns the list of loan_types.

  ## Examples

      iex> list_loan_types()
      [%LoanType{}, ...]

  """
  def list_loan_types do
    Repo.all(LoanType)
  end

  @doc """
  Gets a single loan_type.

  Raises `Ecto.NoResultsError` if the Loan type does not exist.

  ## Examples

      iex> get_loan_type!(123)
      %LoanType{}

      iex> get_loan_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_loan_type!(id), do: Repo.get!(LoanType, id)

  @doc """
  Creates a loan_type.

  ## Examples

      iex> create_loan_type(%{field: value})
      {:ok, %LoanType{}}

      iex> create_loan_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_loan_type(attrs \\ %{}) do
    %LoanType{}
    |> LoanType.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a loan_type.

  ## Examples

      iex> update_loan_type(loan_type, %{field: new_value})
      {:ok, %LoanType{}}

      iex> update_loan_type(loan_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_loan_type(%LoanType{} = loan_type, attrs) do
    loan_type
    |> LoanType.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a loan_type.

  ## Examples

      iex> delete_loan_type(loan_type)
      {:ok, %LoanType{}}

      iex> delete_loan_type(loan_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_loan_type(%LoanType{} = loan_type) do
    Repo.delete(loan_type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking loan_type changes.

  ## Examples

      iex> change_loan_type(loan_type)
      %Ecto.Changeset{data: %LoanType{}}

  """
  def change_loan_type(%LoanType{} = loan_type, attrs \\ %{}) do
    LoanType.changeset(loan_type, attrs)
  end

  alias Madeni.Loans.LoanProduct

  @doc """
  Returns the list of loan_products.

  ## Examples

      iex> list_loan_products()
      [%LoanProduct{}, ...]

  """
  def list_loan_products do
    Repo.all(LoanProduct)
  end

  @doc """
  Gets a single loan_product.

  Raises `Ecto.NoResultsError` if the Loan product does not exist.

  ## Examples

      iex> get_loan_product!(123)
      %LoanProduct{}

      iex> get_loan_product!(456)
      ** (Ecto.NoResultsError)

  """
  def get_loan_product!(id), do: Repo.get!(LoanProduct, id)

  @doc """
  Creates a loan_product.

  ## Examples

      iex> create_loan_product(%{field: value})
      {:ok, %LoanProduct{}}

      iex> create_loan_product(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_loan_product(attrs \\ %{}) do
    %LoanProduct{}
    |> LoanProduct.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a loan_product.

  ## Examples

      iex> update_loan_product(loan_product, %{field: new_value})
      {:ok, %LoanProduct{}}

      iex> update_loan_product(loan_product, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_loan_product(%LoanProduct{} = loan_product, attrs) do
    loan_product
    |> LoanProduct.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a loan_product.

  ## Examples

      iex> delete_loan_product(loan_product)
      {:ok, %LoanProduct{}}

      iex> delete_loan_product(loan_product)
      {:error, %Ecto.Changeset{}}

  """
  def delete_loan_product(%LoanProduct{} = loan_product) do
    Repo.delete(loan_product)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking loan_product changes.

  ## Examples

      iex> change_loan_product(loan_product)
      %Ecto.Changeset{data: %LoanProduct{}}

  """
  def change_loan_product(%LoanProduct{} = loan_product, attrs \\ %{}) do
    LoanProduct.changeset(loan_product, attrs)
  end

  alias Madeni.Loans.UserLoan

  @doc """
  Returns the list of user_loans.

  ## Examples

      iex> list_user_loans()
      [%UserLoan{}, ...]

  """
  def list_user_loans do
    Repo.all(UserLoan)
  end

  @doc """
  Gets a single user_loan.

  Raises `Ecto.NoResultsError` if the User loan does not exist.

  ## Examples

      iex> get_user_loan!(123)
      %UserLoan{}

      iex> get_user_loan!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user_loan!(id), do: Repo.get!(UserLoan, id)

  @doc """
  Creates a user_loan.

  ## Examples

      iex> create_user_loan(%{field: value})
      {:ok, %UserLoan{}}

      iex> create_user_loan(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user_loan(attrs \\ %{}) do
    %UserLoan{}
    |> UserLoan.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user_loan.

  ## Examples

      iex> update_user_loan(user_loan, %{field: new_value})
      {:ok, %UserLoan{}}

      iex> update_user_loan(user_loan, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user_loan(%UserLoan{} = user_loan, attrs) do
    user_loan
    |> UserLoan.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user_loan.

  ## Examples

      iex> delete_user_loan(user_loan)
      {:ok, %UserLoan{}}

      iex> delete_user_loan(user_loan)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user_loan(%UserLoan{} = user_loan) do
    Repo.delete(user_loan)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user_loan changes.

  ## Examples

      iex> change_user_loan(user_loan)
      %Ecto.Changeset{data: %UserLoan{}}

  """
  def change_user_loan(%UserLoan{} = user_loan, attrs \\ %{}) do
    UserLoan.changeset(user_loan, attrs)
  end
end
