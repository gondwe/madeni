defmodule MadeniWeb.LoanTypeControllerTest do
  use MadeniWeb.ConnCase

  import Madeni.LoansFixtures

  @create_attrs %{name: "some name", description: "some description", rate: "120.5"}
  @update_attrs %{
    name: "some updated name",
    description: "some updated description",
    rate: "456.7"
  }
  @invalid_attrs %{name: nil, description: nil, rate: nil}

  describe "index" do
    test "lists all loan_types", %{conn: conn} do
      conn = get(conn, ~p"/admin/loan_types")
      assert html_response(conn, 200) =~ "Listing Loan types"
    end
  end

  describe "new loan_type" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/admin/loan_types/new")
      assert html_response(conn, 200) =~ "New Loan type"
    end
  end

  describe "create loan_type" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/admin/loan_types", loan_type: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/admin/loan_types/#{id}"

      conn = get(conn, ~p"/admin/loan_types/#{id}")
      assert html_response(conn, 200) =~ "Loan type #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/admin/loan_types", loan_type: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Loan type"
    end
  end

  describe "edit loan_type" do
    setup [:create_loan_type]

    test "renders form for editing chosen loan_type", %{conn: conn, loan_type: loan_type} do
      conn = get(conn, ~p"/admin/loan_types/#{loan_type}/edit")
      assert html_response(conn, 200) =~ "Edit Loan type"
    end
  end

  describe "update loan_type" do
    setup [:create_loan_type]

    test "redirects when data is valid", %{conn: conn, loan_type: loan_type} do
      conn = put(conn, ~p"/admin/loan_types/#{loan_type}", loan_type: @update_attrs)
      assert redirected_to(conn) == ~p"/admin/loan_types/#{loan_type}"

      conn = get(conn, ~p"/admin/loan_types/#{loan_type}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, loan_type: loan_type} do
      conn = put(conn, ~p"/admin/loan_types/#{loan_type}", loan_type: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Loan type"
    end
  end

  describe "delete loan_type" do
    setup [:create_loan_type]

    test "deletes chosen loan_type", %{conn: conn, loan_type: loan_type} do
      conn = delete(conn, ~p"/admin/loan_types/#{loan_type}")
      assert redirected_to(conn) == ~p"/admin/loan_types"

      assert_error_sent 404, fn ->
        get(conn, ~p"/admin/loan_types/#{loan_type}")
      end
    end
  end

  defp create_loan_type(_) do
    loan_type = loan_type_fixture()
    %{loan_type: loan_type}
  end
end
