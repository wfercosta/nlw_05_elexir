defmodule Nlw05Elexir do

  alias Nlw05Elexir.Restaurants.Create, as: RestaurantCreate
  alias Nlw05Elexir.Supplies.Create, as: SupplyCreate
  alias Nlw05Elexir.Supplies.Get, as: GetSupply

  defdelegate create_restaurant(params), to: RestaurantCreate, as: :call
  defdelegate create_supply(params), to: SupplyCreate, as: :call

  defdelegate get_supply(params), to: GetSupply, as: :call
end
