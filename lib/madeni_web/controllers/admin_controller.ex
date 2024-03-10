defmodule MadeniWeb.AdminController do
  use MadeniWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
