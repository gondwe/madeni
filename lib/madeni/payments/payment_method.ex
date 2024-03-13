defmodule Madeni.Payments.PaymentMethod do
  use Ecto.Schema
  import Ecto.Changeset

  schema "payment_methods" do
    field :active, :boolean, default: false
    field :name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(payment_method, attrs) do
    payment_method
    |> cast(attrs, [:name, :active])
    |> validate_required([:name, :active])
  end
end
