defmodule Nlw05ElexirWeb.SuppliesController do
  use Nlw05ElexirWeb, :controller

  alias Nlw05Elexir.{Supply}
  alias Nlw05ElexirWeb.{FallbackController}

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Supply{} = supply} <- Nlw05Elexir.create_supply(params) do
      conn
      |> put_status(:created)
      |> render("create.json", supply: supply)
    end
  end

  def show(conn, %{"id" => uuid}) do
    with {:ok, %Supply{} = supply} <- Nlw05Elexir.get_supply(uuid) do
      conn
      |> put_status(:ok)
      |> render("show.json", supply: supply)
    end
  end
end
