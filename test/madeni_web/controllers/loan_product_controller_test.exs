defmodule MadeniWeb.LoanProductControllerTest do
  use MadeniWeb.ConnCase

  import Madeni.LoansFixtures

  @create_attrs %{description: "some description", interest_rate: "120.5"}
  @update_attrs %{description: "some updated description", interest_rate: "456.7"}
  @invalid_attrs %{description: nil, interest_rate: nil}

  describe "index" do
    test "lists all loan_products", %{conn: conn} do
      conn = get(conn, ~p"/admin/loan_products")
      assert html_response(conn, 200) =~ "Listing Loan products"
    end
  end

  describe "new loan_product" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/admin/loan_products/new")
      assert html_response(conn, 200) =~ "New Loan product"
    end
  end

  describe "create loan_product" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/admin/loan_products", loan_product: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/admin/loan_products/#{id}"

      conn = get(conn, ~p"/admin/loan_products/#{id}")
      assert html_response(conn, 200) =~ "Loan product #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/admin/loan_products", loan_product: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Loan product"
    end
  end

  describe "edit loan_product" do
    setup [:create_loan_product]

    test "renders form for editing chosen loan_product", %{conn: conn, loan_product: loan_product} do
      conn = get(conn, ~p"/admin/loan_products/#{loan_product}/edit")
      assert html_response(conn, 200) =~ "Edit Loan product"
    end
  end

  describe "update loan_product" do
    setup [:create_loan_product]

    test "redirects when data is valid", %{conn: conn, loan_product: loan_product} do
      conn = put(conn, ~p"/admin/loan_products/#{loan_product}", loan_product: @update_attrs)
      assert redirected_to(conn) == ~p"/admin/loan_products/#{loan_product}"

      conn = get(conn, ~p"/admin/loan_products/#{loan_product}")
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, loan_product: loan_product} do
      conn = put(conn, ~p"/admin/loan_products/#{loan_product}", loan_product: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Loan product"
    end
  end

  describe "delete loan_product" do
    setup [:create_loan_product]

    test "deletes chosen loan_product", %{conn: conn, loan_product: loan_product} do
      conn = delete(conn, ~p"/admin/loan_products/#{loan_product}")
      assert redirected_to(conn) == ~p"/admin/loan_products"

      assert_error_sent 404, fn ->
        get(conn, ~p"/admin/loan_products/#{loan_product}")
      end
    end
  end

  defp create_loan_product(_) do
    loan_product = loan_product_fixture()
    %{loan_product: loan_product}
  end
end
