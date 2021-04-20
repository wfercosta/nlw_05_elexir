defmodule Nlw05Elexir.Repo do
  use Ecto.Repo,
    otp_app: :nlw_05_elexir,
    adapter: Ecto.Adapters.Postgres
end
