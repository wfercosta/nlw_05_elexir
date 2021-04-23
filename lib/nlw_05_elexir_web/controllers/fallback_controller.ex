defmodule  Nlw05ElexirWeb.FallbackController do
  use Nlw05ElexirWeb, :controller

  alias Nlw05ElexirWeb.ErrorView

  def call(conn, {:error, %{result: result, status: status}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
