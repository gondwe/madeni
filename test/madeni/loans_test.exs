defmodule Madeni.LoansTest do
  use Madeni.DataCase

  alias Madeni.Loans

  describe "loan_types" do
    alias Madeni.Loans.LoanType

    import Madeni.LoansFixtures

    @invalid_attrs %{name: nil, description: nil, rate: nil}

    test "list_loan_types/0 returns all loan_types" do
      loan_type = loan_type_fixture()
      assert Loans.list_loan_types() == [loan_type]
    end

    test "get_loan_type!/1 returns the loan_type with given id" do
      loan_type = loan_type_fixture()
      assert Loans.get_loan_type!(loan_type.id) == loan_type
    end

    test "create_loan_type/1 with valid data creates a loan_type" do
      valid_attrs = %{name: "some name", description: "some description", rate: "120.5"}

      assert {:ok, %LoanType{} = loan_type} = Loans.create_loan_type(valid_attrs)
      assert loan_type.name == "some name"
      assert loan_type.description == "some description"
      assert loan_type.rate == Decimal.new("120.5")
    end

    test "create_loan_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Loans.create_loan_type(@invalid_attrs)
    end

    test "update_loan_type/2 with valid data updates the loan_type" do
      loan_type = loan_type_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description", rate: "456.7"}

      assert {:ok, %LoanType{} = loan_type} = Loans.update_loan_type(loan_type, update_attrs)
      assert loan_type.name == "some updated name"
      assert loan_type.description == "some updated description"
      assert loan_type.rate == Decimal.new("456.7")
    end

    test "update_loan_type/2 with invalid data returns error changeset" do
      loan_type = loan_type_fixture()
      assert {:error, %Ecto.Changeset{}} = Loans.update_loan_type(loan_type, @invalid_attrs)
      assert loan_type == Loans.get_loan_type!(loan_type.id)
    end

    test "delete_loan_type/1 deletes the loan_type" do
      loan_type = loan_type_fixture()
      assert {:ok, %LoanType{}} = Loans.delete_loan_type(loan_type)
      assert_raise Ecto.NoResultsError, fn -> Loans.get_loan_type!(loan_type.id) end
    end

    test "change_loan_type/1 returns a loan_type changeset" do
      loan_type = loan_type_fixture()
      assert %Ecto.Changeset{} = Loans.change_loan_type(loan_type)
    end
  end

  describe "loan_products" do
    alias Madeni.Loans.LoanProduct

    import Madeni.LoansFixtures

    @invalid_attrs %{description: nil, interest_rate: nil}

    test "list_loan_products/0 returns all loan_products" do
      loan_product = loan_product_fixture()
      assert Loans.list_loan_products() == [loan_product]
    end

    test "get_loan_product!/1 returns the loan_product with given id" do
      loan_product = loan_product_fixture()
      assert Loans.get_loan_product!(loan_product.id) == loan_product
    end

    test "create_loan_product/1 with valid data creates a loan_product" do
      valid_attrs = %{description: "some description", interest_rate: "120.5"}

      assert {:ok, %LoanProduct{} = loan_product} = Loans.create_loan_product(valid_attrs)
      assert loan_product.description == "some description"
      assert loan_product.interest_rate == Decimal.new("120.5")
    end

    test "create_loan_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Loans.create_loan_product(@invalid_attrs)
    end

    test "update_loan_product/2 with valid data updates the loan_product" do
      loan_product = loan_product_fixture()
      update_attrs = %{description: "some updated description", interest_rate: "456.7"}

      assert {:ok, %LoanProduct{} = loan_product} = Loans.update_loan_product(loan_product, update_attrs)
      assert loan_product.description == "some updated description"
      assert loan_product.interest_rate == Decimal.new("456.7")
    end

    test "update_loan_product/2 with invalid data returns error changeset" do
      loan_product = loan_product_fixture()
      assert {:error, %Ecto.Changeset{}} = Loans.update_loan_product(loan_product, @invalid_attrs)
      assert loan_product == Loans.get_loan_product!(loan_product.id)
    end

    test "delete_loan_product/1 deletes the loan_product" do
      loan_product = loan_product_fixture()
      assert {:ok, %LoanProduct{}} = Loans.delete_loan_product(loan_product)
      assert_raise Ecto.NoResultsError, fn -> Loans.get_loan_product!(loan_product.id) end
    end

    test "change_loan_product/1 returns a loan_product changeset" do
      loan_product = loan_product_fixture()
      assert %Ecto.Changeset{} = Loans.change_loan_product(loan_product)
    end
  end

  describe "user_loans" do
    alias Madeni.Loans.UserLoan

    import Madeni.LoansFixtures

    @invalid_attrs %{}

    test "list_user_loans/0 returns all user_loans" do
      user_loan = user_loan_fixture()
      assert Loans.list_user_loans() == [user_loan]
    end

    test "get_user_loan!/1 returns the user_loan with given id" do
      user_loan = user_loan_fixture()
      assert Loans.get_user_loan!(user_loan.id) == user_loan
    end

    test "create_user_loan/1 with valid data creates a user_loan" do
      valid_attrs = %{}

      assert {:ok, %UserLoan{} = user_loan} = Loans.create_user_loan(valid_attrs)
    end

    test "create_user_loan/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Loans.create_user_loan(@invalid_attrs)
    end

    test "update_user_loan/2 with valid data updates the user_loan" do
      user_loan = user_loan_fixture()
      update_attrs = %{}

      assert {:ok, %UserLoan{} = user_loan} = Loans.update_user_loan(user_loan, update_attrs)
    end

    test "update_user_loan/2 with invalid data returns error changeset" do
      user_loan = user_loan_fixture()
      assert {:error, %Ecto.Changeset{}} = Loans.update_user_loan(user_loan, @invalid_attrs)
      assert user_loan == Loans.get_user_loan!(user_loan.id)
    end

    test "delete_user_loan/1 deletes the user_loan" do
      user_loan = user_loan_fixture()
      assert {:ok, %UserLoan{}} = Loans.delete_user_loan(user_loan)
      assert_raise Ecto.NoResultsError, fn -> Loans.get_user_loan!(user_loan.id) end
    end

    test "change_user_loan/1 returns a user_loan changeset" do
      user_loan = user_loan_fixture()
      assert %Ecto.Changeset{} = Loans.change_user_loan(user_loan)
    end
  end
end
