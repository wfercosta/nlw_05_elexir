defmodule Nlw05ElexirWeb.SuppliesView do
  use Nlw05ElexirWeb, :view

  def render("create.json", %{supply: supply}) do
    %{
      message: "Supply created!",
      supply: supply
    }
  end

  def render("show.json", %{supply: supply}), do: %{supply: supply}

end
