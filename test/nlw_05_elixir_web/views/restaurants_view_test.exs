defmodule Nlw05ElixirWeb.RestaurantsViewTest do
  use Nlw05ElixirWeb.ConnCase

  alias Nlw05Elixir.Restaurant
  alias Nlw05ElixirWeb.RestaurantsView
  import Phoenix.View

  describe "render/2" do
    test "renders create.json" do
      params = %{name: "Siri cascudo", email: "siri@cascudo.com"}
      {:ok, restaurant} = Nlw05Elixir.create_restaurant(params)

      response = render(RestaurantsView, "create.json", restaurant: restaurant)

      assert %{
               message: "Restaurant created!",
               restaurant: %Restaurant{
                 email: "siri@cascudo.com",
                 name: "Siri cascudo",
                 id: _id
               }
             } = response
    end
  end
end
