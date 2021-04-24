defmodule Nlw05Elixir do
  alias Nlw05Elixir.Restaurants.Create, as: RestaurantCreate
  alias Nlw05Elixir.Supplies.Create, as: SupplyCreate
  alias Nlw05Elixir.Supplies.Get, as: GetSupply

  defdelegate create_restaurant(params), to: RestaurantCreate, as: :call
  defdelegate create_supply(params), to: SupplyCreate, as: :call

  defdelegate get_supply(params), to: GetSupply, as: :call
end
