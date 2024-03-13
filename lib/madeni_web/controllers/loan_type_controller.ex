defmodule MadeniWeb.LoanTypeController do
  use MadeniWeb, :controller

  alias Madeni.Loans
  alias Madeni.Loans.LoanType

  def index(conn, _params) do
    loan_types = Loans.list_loan_types()
    render(conn, :index, loan_types: loan_types)
  end

  def new(conn, _params) do
    changeset = Loans.change_loan_type(%LoanType{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"loan_type" => loan_type_params}) do
    case Loans.create_loan_type(loan_type_params) do
      {:ok, loan_type} ->
        conn
        |> put_flash(:info, "Loan type created successfully.")
        |> redirect(to: ~p"/admin/loan_types/#{loan_type}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    loan_type = Loans.get_loan_type!(id)
    render(conn, :show, loan_type: loan_type)
  end

  def edit(conn, %{"id" => id}) do
    loan_type = Loans.get_loan_type!(id)
    changeset = Loans.change_loan_type(loan_type)
    render(conn, :edit, loan_type: loan_type, changeset: changeset)
  end

  def update(conn, %{"id" => id, "loan_type" => loan_type_params}) do
    loan_type = Loans.get_loan_type!(id)

    case Loans.update_loan_type(loan_type, loan_type_params) do
      {:ok, loan_type} ->
        conn
        |> put_flash(:info, "Loan type updated successfully.")
        |> redirect(to: ~p"/admin/loan_types/#{loan_type}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, loan_type: loan_type, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    loan_type = Loans.get_loan_type!(id)
    {:ok, _loan_type} = Loans.delete_loan_type(loan_type)

    conn
    |> put_flash(:info, "Loan type deleted successfully.")
    |> redirect(to: ~p"/admin/loan_types")
  end
end
