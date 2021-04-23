defmodule Nlw05Elexir.Supplies.Get do

  alias Nlw05Elexir.{Repo, Supply}

  def call(uuid) do
    case Repo.get(Supply, uuid) do
     nil -> {:error, %{result: "Supply not found", status: :not_found}}
     supply -> {:ok, supply}
    end
  end
end
