defmodule MadeniWeb.PageController do
  use MadeniWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    # render(conn, :home, layout: false)
    # redirect(conn, to: "/users/log_in")

    # redirect to login page if not logged in
    if conn.assigns[:current_user] do
      render(conn, "home.html")
    else
      redirect(conn, to: "/users/log_in")
    end
  end
end
