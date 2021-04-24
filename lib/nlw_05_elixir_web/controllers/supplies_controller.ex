defmodule Nlw05ElixirWeb.SuppliesController do
  use Nlw05ElixirWeb, :controller

  alias Nlw05Elixir.{Supply}
  alias Nlw05ElixirWeb.{FallbackController}

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Supply{} = supply} <- Nlw05Elixir.create_supply(params) do
      conn
      |> put_status(:created)
      |> render("create.json", supply: supply)
    end
  end

  def show(conn, %{"id" => uuid}) do
    with {:ok, %Supply{} = supply} <- Nlw05Elixir.get_supply(uuid) do
      conn
      |> put_status(:ok)
      |> render("show.json", supply: supply)
    end
  end
end
