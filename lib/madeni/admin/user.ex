defmodule Madeni.Admin.User do
  use Ecto.Schema
  import Ecto.Changeset

  import Madeni.Accounts.User

  schema "users" do
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs, opts \\ []) do
    user
    |> cast(attrs, [
      :email,
      :password,
      :first_name,
      :last_name,
      :id_number,
      :phone_number,
      :gender
    ])
    |> validate_required([:first_name, :last_name, :id_number, :phone_number, :gender, :password])
    |> validate_inclusion(:gender, ["male", "female", "other"])
    |> validate_email(opts)
    |> validate_password(opts)
  end
end
