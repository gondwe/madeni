defmodule Madeni.Repo.Migrations.CreatePaymentMethods do
  use Ecto.Migration

  def change do
    create table(:payment_methods) do
      add :name, :string, null: false
      add :active, :boolean, default: false, null: false

      timestamps(type: :utc_datetime)
    end
  end
end
