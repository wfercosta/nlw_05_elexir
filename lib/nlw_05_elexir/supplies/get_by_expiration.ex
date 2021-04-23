defmodule Nlw05Elexir.Supplies.GetByExpiration do
  import Ecto.Query

  alias Nlw05Elexir.{Repo, Supply, Restaurant}

  def call do
    today  = Date.utc_today()
    beginninig_of_week = Date.beginning_of_week(today)
    end_of_week = Date.end_of_week(today)

    query =
      from supply in Supply,
        where:
          supply.expiration_date >= ^beginninig_of_week and supply.expiration_date <= ^end_of_week,
        preload: [:restaurant]

    query
    |> Repo.all()
    |> Enum.group_by(fn %Supply{restaurant: %Restaurant{email: email}} -> email end)
  end
end
