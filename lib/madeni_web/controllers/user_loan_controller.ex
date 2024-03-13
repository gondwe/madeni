defmodule MadeniWeb.UserLoanController do
  use MadeniWeb, :controller

  alias Madeni.Loans
  alias Madeni.Loans.UserLoan

  def index(conn, _params) do
    user_loans = Loans.list_user_loans()
    render(conn, :index, user_loans: user_loans)
  end

  def new(conn, _params) do
    changeset = Loans.change_user_loan(%UserLoan{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"user_loan" => user_loan_params}) do
    case Loans.create_user_loan(user_loan_params) do
      {:ok, user_loan} ->
        conn
        |> put_flash(:info, "User loan created successfully.")
        |> redirect(to: ~p"/admin/user_loans/#{user_loan}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    user_loan = Loans.get_user_loan!(id)
    render(conn, :show, user_loan: user_loan)
  end

  def edit(conn, %{"id" => id}) do
    user_loan = Loans.get_user_loan!(id)
    changeset = Loans.change_user_loan(user_loan)
    render(conn, :edit, user_loan: user_loan, changeset: changeset)
  end

  def update(conn, %{"id" => id, "user_loan" => user_loan_params}) do
    user_loan = Loans.get_user_loan!(id)

    case Loans.update_user_loan(user_loan, user_loan_params) do
      {:ok, user_loan} ->
        conn
        |> put_flash(:info, "User loan updated successfully.")
        |> redirect(to: ~p"/admin/user_loans/#{user_loan}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, user_loan: user_loan, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user_loan = Loans.get_user_loan!(id)
    {:ok, _user_loan} = Loans.delete_user_loan(user_loan)

    conn
    |> put_flash(:info, "User loan deleted successfully.")
    |> redirect(to: ~p"/admin/user_loans")
  end
end
