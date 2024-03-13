defmodule MadeniWeb.UserLoanControllerTest do
  use MadeniWeb.ConnCase

  import Madeni.LoansFixtures

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  describe "index" do
    test "lists all user_loans", %{conn: conn} do
      conn = get(conn, ~p"/admin/user_loans")
      assert html_response(conn, 200) =~ "Listing User loans"
    end
  end

  describe "new user_loan" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/admin/user_loans/new")
      assert html_response(conn, 200) =~ "New User loan"
    end
  end

  describe "create user_loan" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/admin/user_loans", user_loan: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/admin/user_loans/#{id}"

      conn = get(conn, ~p"/admin/user_loans/#{id}")
      assert html_response(conn, 200) =~ "User loan #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/admin/user_loans", user_loan: @invalid_attrs)
      assert html_response(conn, 200) =~ "New User loan"
    end
  end

  describe "edit user_loan" do
    setup [:create_user_loan]

    test "renders form for editing chosen user_loan", %{conn: conn, user_loan: user_loan} do
      conn = get(conn, ~p"/admin/user_loans/#{user_loan}/edit")
      assert html_response(conn, 200) =~ "Edit User loan"
    end
  end

  describe "update user_loan" do
    setup [:create_user_loan]

    test "redirects when data is valid", %{conn: conn, user_loan: user_loan} do
      conn = put(conn, ~p"/admin/user_loans/#{user_loan}", user_loan: @update_attrs)
      assert redirected_to(conn) == ~p"/admin/user_loans/#{user_loan}"

      conn = get(conn, ~p"/admin/user_loans/#{user_loan}")
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, user_loan: user_loan} do
      conn = put(conn, ~p"/admin/user_loans/#{user_loan}", user_loan: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit User loan"
    end
  end

  describe "delete user_loan" do
    setup [:create_user_loan]

    test "deletes chosen user_loan", %{conn: conn, user_loan: user_loan} do
      conn = delete(conn, ~p"/admin/user_loans/#{user_loan}")
      assert redirected_to(conn) == ~p"/admin/user_loans"

      assert_error_sent 404, fn ->
        get(conn, ~p"/admin/user_loans/#{user_loan}")
      end
    end
  end

  defp create_user_loan(_) do
    user_loan = user_loan_fixture()
    %{user_loan: user_loan}
  end
end
