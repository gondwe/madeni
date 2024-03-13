defmodule MadeniWeb.LoanPaymentController do
  use MadeniWeb, :controller

  alias Madeni.Repayments
  alias Madeni.Repayments.LoanPayment

  def index(conn, _params) do
    loan_payments = Repayments.list_loan_payments()
    render(conn, :index, loan_payments: loan_payments)
  end

  def new(conn, _params) do
    changeset = Repayments.change_loan_payment(%LoanPayment{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"loan_payment" => loan_payment_params}) do
    case Repayments.create_loan_payment(loan_payment_params) do
      {:ok, loan_payment} ->
        conn
        |> put_flash(:info, "Loan payment created successfully.")
        |> redirect(to: ~p"/loan_payments/#{loan_payment}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    loan_payment = Repayments.get_loan_payment!(id)
    render(conn, :show, loan_payment: loan_payment)
  end

  def edit(conn, %{"id" => id}) do
    loan_payment = Repayments.get_loan_payment!(id)
    changeset = Repayments.change_loan_payment(loan_payment)
    render(conn, :edit, loan_payment: loan_payment, changeset: changeset)
  end

  def update(conn, %{"id" => id, "loan_payment" => loan_payment_params}) do
    loan_payment = Repayments.get_loan_payment!(id)

    case Repayments.update_loan_payment(loan_payment, loan_payment_params) do
      {:ok, loan_payment} ->
        conn
        |> put_flash(:info, "Loan payment updated successfully.")
        |> redirect(to: ~p"/loan_payments/#{loan_payment}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, loan_payment: loan_payment, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    loan_payment = Repayments.get_loan_payment!(id)
    {:ok, _loan_payment} = Repayments.delete_loan_payment(loan_payment)

    conn
    |> put_flash(:info, "Loan payment deleted successfully.")
    |> redirect(to: ~p"/loan_payments")
  end
end
