defmodule Madeni.RepaymentsTest do
  use Madeni.DataCase

  alias Madeni.Repayments

  describe "loan_payments" do
    alias Madeni.Repayments.LoanPayment

    import Madeni.RepaymentsFixtures

    @invalid_attrs %{amount: nil}

    test "list_loan_payments/0 returns all loan_payments" do
      loan_payment = loan_payment_fixture()
      assert Repayments.list_loan_payments() == [loan_payment]
    end

    test "get_loan_payment!/1 returns the loan_payment with given id" do
      loan_payment = loan_payment_fixture()
      assert Repayments.get_loan_payment!(loan_payment.id) == loan_payment
    end

    test "create_loan_payment/1 with valid data creates a loan_payment" do
      valid_attrs = %{amount: "120.5"}

      assert {:ok, %LoanPayment{} = loan_payment} = Repayments.create_loan_payment(valid_attrs)
      assert loan_payment.amount == Decimal.new("120.5")
    end

    test "create_loan_payment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Repayments.create_loan_payment(@invalid_attrs)
    end

    test "update_loan_payment/2 with valid data updates the loan_payment" do
      loan_payment = loan_payment_fixture()
      update_attrs = %{amount: "456.7"}

      assert {:ok, %LoanPayment{} = loan_payment} = Repayments.update_loan_payment(loan_payment, update_attrs)
      assert loan_payment.amount == Decimal.new("456.7")
    end

    test "update_loan_payment/2 with invalid data returns error changeset" do
      loan_payment = loan_payment_fixture()
      assert {:error, %Ecto.Changeset{}} = Repayments.update_loan_payment(loan_payment, @invalid_attrs)
      assert loan_payment == Repayments.get_loan_payment!(loan_payment.id)
    end

    test "delete_loan_payment/1 deletes the loan_payment" do
      loan_payment = loan_payment_fixture()
      assert {:ok, %LoanPayment{}} = Repayments.delete_loan_payment(loan_payment)
      assert_raise Ecto.NoResultsError, fn -> Repayments.get_loan_payment!(loan_payment.id) end
    end

    test "change_loan_payment/1 returns a loan_payment changeset" do
      loan_payment = loan_payment_fixture()
      assert %Ecto.Changeset{} = Repayments.change_loan_payment(loan_payment)
    end
  end
end
