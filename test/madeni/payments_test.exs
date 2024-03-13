defmodule Madeni.PaymentsTest do
  use Madeni.DataCase

  alias Madeni.Payments

  describe "payment_methods" do
    alias Madeni.Payments.PaymentMethod

    import Madeni.PaymentsFixtures

    @invalid_attrs %{active: nil, name: nil}

    test "list_payment_methods/0 returns all payment_methods" do
      payment_method = payment_method_fixture()
      assert Payments.list_payment_methods() == [payment_method]
    end

    test "get_payment_method!/1 returns the payment_method with given id" do
      payment_method = payment_method_fixture()
      assert Payments.get_payment_method!(payment_method.id) == payment_method
    end

    test "create_payment_method/1 with valid data creates a payment_method" do
      valid_attrs = %{active: true, name: "some name"}

      assert {:ok, %PaymentMethod{} = payment_method} = Payments.create_payment_method(valid_attrs)
      assert payment_method.active == true
      assert payment_method.name == "some name"
    end

    test "create_payment_method/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Payments.create_payment_method(@invalid_attrs)
    end

    test "update_payment_method/2 with valid data updates the payment_method" do
      payment_method = payment_method_fixture()
      update_attrs = %{active: false, name: "some updated name"}

      assert {:ok, %PaymentMethod{} = payment_method} = Payments.update_payment_method(payment_method, update_attrs)
      assert payment_method.active == false
      assert payment_method.name == "some updated name"
    end

    test "update_payment_method/2 with invalid data returns error changeset" do
      payment_method = payment_method_fixture()
      assert {:error, %Ecto.Changeset{}} = Payments.update_payment_method(payment_method, @invalid_attrs)
      assert payment_method == Payments.get_payment_method!(payment_method.id)
    end

    test "delete_payment_method/1 deletes the payment_method" do
      payment_method = payment_method_fixture()
      assert {:ok, %PaymentMethod{}} = Payments.delete_payment_method(payment_method)
      assert_raise Ecto.NoResultsError, fn -> Payments.get_payment_method!(payment_method.id) end
    end

    test "change_payment_method/1 returns a payment_method changeset" do
      payment_method = payment_method_fixture()
      assert %Ecto.Changeset{} = Payments.change_payment_method(payment_method)
    end
  end
end
