defmodule MadeniWeb.ExtPlug do
  import Plug.Conn
  # import Phoenix.Controller

  def init(opts), do: opts

  def call(conn, _opts) do
    assign(conn, :context, "ext")
  end
end
