defmodule MadeniWeb.Shared do
  use Phoenix.Component

  embed_templates "shared/*"

  def admin_context?(assigns) do
    Map.get(assigns, :context) == "admin"
  end

  def full_name(user) do
    "#{user.first_name} #{user.last_name}"
  end
end
