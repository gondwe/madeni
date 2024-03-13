defmodule MadeniWeb.PaymentMethodController do
  use MadeniWeb, :controller

  alias Madeni.Payments
  alias Madeni.Payments.PaymentMethod

  def index(conn, _params) do
    payment_methods = Payments.list_payment_methods()
    render(conn, :index, payment_methods: payment_methods)
  end

  def new(conn, _params) do
    changeset = Payments.change_payment_method(%PaymentMethod{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"payment_method" => payment_method_params}) do
    case Payments.create_payment_method(payment_method_params) do
      {:ok, payment_method} ->
        conn
        |> put_flash(:info, "Payment method created successfully.")
        |> redirect(to: ~p"/admin/payment_methods/#{payment_method}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    payment_method = Payments.get_payment_method!(id)
    render(conn, :show, payment_method: payment_method)
  end

  def edit(conn, %{"id" => id}) do
    payment_method = Payments.get_payment_method!(id)
    changeset = Payments.change_payment_method(payment_method)
    render(conn, :edit, payment_method: payment_method, changeset: changeset)
  end

  def update(conn, %{"id" => id, "payment_method" => payment_method_params}) do
    payment_method = Payments.get_payment_method!(id)

    case Payments.update_payment_method(payment_method, payment_method_params) do
      {:ok, payment_method} ->
        conn
        |> put_flash(:info, "Payment method updated successfully.")
        |> redirect(to: ~p"/admin/payment_methods/#{payment_method}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, payment_method: payment_method, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    payment_method = Payments.get_payment_method!(id)
    {:ok, _payment_method} = Payments.delete_payment_method(payment_method)

    conn
    |> put_flash(:info, "Payment method deleted successfully.")
    |> redirect(to: ~p"/admin/payment_methods")
  end
end
