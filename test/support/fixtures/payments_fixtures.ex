defmodule Madeni.PaymentsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Madeni.Payments` context.
  """

  @doc """
  Generate a payment_method.
  """
  def payment_method_fixture(attrs \\ %{}) do
    {:ok, payment_method} =
      attrs
      |> Enum.into(%{
        active: true,
        name: "some name"
      })
      |> Madeni.Payments.create_payment_method()

    payment_method
  end
end
