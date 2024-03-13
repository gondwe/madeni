defmodule MadeniWeb.LoanPaymentControllerTest do
  use MadeniWeb.ConnCase

  import Madeni.RepaymentsFixtures

  @create_attrs %{amount: "120.5"}
  @update_attrs %{amount: "456.7"}
  @invalid_attrs %{amount: nil}

  describe "index" do
    test "lists all loan_payments", %{conn: conn} do
      conn = get(conn, ~p"/loan_payments")
      assert html_response(conn, 200) =~ "Listing Loan payments"
    end
  end

  describe "new loan_payment" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/loan_payments/new")
      assert html_response(conn, 200) =~ "New Loan payment"
    end
  end

  describe "create loan_payment" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/loan_payments", loan_payment: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/loan_payments/#{id}"

      conn = get(conn, ~p"/loan_payments/#{id}")
      assert html_response(conn, 200) =~ "Loan payment #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/loan_payments", loan_payment: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Loan payment"
    end
  end

  describe "edit loan_payment" do
    setup [:create_loan_payment]

    test "renders form for editing chosen loan_payment", %{conn: conn, loan_payment: loan_payment} do
      conn = get(conn, ~p"/loan_payments/#{loan_payment}/edit")
      assert html_response(conn, 200) =~ "Edit Loan payment"
    end
  end

  describe "update loan_payment" do
    setup [:create_loan_payment]

    test "redirects when data is valid", %{conn: conn, loan_payment: loan_payment} do
      conn = put(conn, ~p"/loan_payments/#{loan_payment}", loan_payment: @update_attrs)
      assert redirected_to(conn) == ~p"/loan_payments/#{loan_payment}"

      conn = get(conn, ~p"/loan_payments/#{loan_payment}")
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, loan_payment: loan_payment} do
      conn = put(conn, ~p"/loan_payments/#{loan_payment}", loan_payment: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Loan payment"
    end
  end

  describe "delete loan_payment" do
    setup [:create_loan_payment]

    test "deletes chosen loan_payment", %{conn: conn, loan_payment: loan_payment} do
      conn = delete(conn, ~p"/loan_payments/#{loan_payment}")
      assert redirected_to(conn) == ~p"/loan_payments"

      assert_error_sent 404, fn ->
        get(conn, ~p"/loan_payments/#{loan_payment}")
      end
    end
  end

  defp create_loan_payment(_) do
    loan_payment = loan_payment_fixture()
    %{loan_payment: loan_payment}
  end
end
