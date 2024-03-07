defmodule Madeni.Repo do
  use Ecto.Repo,
    otp_app: :madeni,
    adapter: Ecto.Adapters.Postgres
end
