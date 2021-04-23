defmodule Nlw05ElexirWeb.RestaurantsView do
  use Nlw05ElexirWeb, :view

  def render("create.json", %{restaurant: restaurant}) do
    %{
      message: "Restaurant created!",
      restaurant: restaurant
    }
  end
end
