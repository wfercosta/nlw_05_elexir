defmodule Nlw05ElixirWeb.FallbackController do
  use Nlw05ElixirWeb, :controller

  alias Nlw05ElixirWeb.ErrorView

  def call(conn, {:error, %{result: result, status: status}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
