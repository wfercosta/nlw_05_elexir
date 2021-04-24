defmodule Nlw05ElixirWeb.RestaurantsView do
  use Nlw05ElixirWeb, :view

  def render("create.json", %{restaurant: restaurant}) do
    %{
      message: "Restaurant created!",
      restaurant: restaurant
    }
  end
end
