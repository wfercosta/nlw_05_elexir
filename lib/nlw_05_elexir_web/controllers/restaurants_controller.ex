defmodule Nlw05ElexirWeb.RestaurantsController do
  use Nlw05ElexirWeb, :controller

  alias Nlw05Elexir.{Restaurant}
  alias Nlw05ElexirWeb.{FallbackController}

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Restaurant{} = restaurant} <- Nlw05Elexir.create_restaurant(params) do
      conn
      |> put_status(:created)
      |> render("create.json", restaurant: restaurant)
    end
  end
end
