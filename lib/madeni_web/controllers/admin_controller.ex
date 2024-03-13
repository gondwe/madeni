defmodule MadeniWeb.AdminController do
  alias Madeni.Accounts
  use MadeniWeb, :controller

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.html", users: users)
  end
end
