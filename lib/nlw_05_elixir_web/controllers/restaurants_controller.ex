defmodule Nlw05ElixirWeb.RestaurantsController do
  use Nlw05ElixirWeb, :controller

  alias Nlw05Elixir.{Restaurant}
  alias Nlw05ElixirWeb.{FallbackController}

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Restaurant{} = restaurant} <- Nlw05Elixir.create_restaurant(params) do
      conn
      |> put_status(:created)
      |> render("create.json", restaurant: restaurant)
    end
  end
end
