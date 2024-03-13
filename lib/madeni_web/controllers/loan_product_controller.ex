defmodule MadeniWeb.LoanProductController do
  use MadeniWeb, :controller

  alias Madeni.Loans
  alias Madeni.Loans.LoanProduct

  def index(conn, _params) do
    loan_products = Loans.list_loan_products()
    render(conn, :index, loan_products: loan_products)
  end

  def new(conn, _params) do
    changeset = Loans.change_loan_product(%LoanProduct{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"loan_product" => loan_product_params}) do
    case Loans.create_loan_product(loan_product_params) do
      {:ok, loan_product} ->
        conn
        |> put_flash(:info, "Loan product created successfully.")
        |> redirect(to: ~p"/admin/loan_products/#{loan_product}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    loan_product = Loans.get_loan_product!(id)
    render(conn, :show, loan_product: loan_product)
  end

  def edit(conn, %{"id" => id}) do
    loan_product = Loans.get_loan_product!(id)
    changeset = Loans.change_loan_product(loan_product)
    render(conn, :edit, loan_product: loan_product, changeset: changeset)
  end

  def update(conn, %{"id" => id, "loan_product" => loan_product_params}) do
    loan_product = Loans.get_loan_product!(id)

    case Loans.update_loan_product(loan_product, loan_product_params) do
      {:ok, loan_product} ->
        conn
        |> put_flash(:info, "Loan product updated successfully.")
        |> redirect(to: ~p"/admin/loan_products/#{loan_product}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, loan_product: loan_product, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    loan_product = Loans.get_loan_product!(id)
    {:ok, _loan_product} = Loans.delete_loan_product(loan_product)

    conn
    |> put_flash(:info, "Loan product deleted successfully.")
    |> redirect(to: ~p"/admin/loan_products")
  end
end
