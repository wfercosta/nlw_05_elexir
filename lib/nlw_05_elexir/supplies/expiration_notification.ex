defmodule Nlw05Elexir.Supplies.ExpirationNotification do
  alias Nlw05Elexir.Supplies.{ExpirationEmail, GetByExpiration}
  alias Nlw05Elexir.Mailer

  def send do
    data = GetByExpiration.call()

    data
    |> Task.async_stream(fn {to_email, supplies} -> send_email(to_email, supplies) end)
    |> Stream.run()
  end

  defp send_email(to_email, supplies) do
    to_email
    |> ExpirationEmail.create(supplies)
    |> Mailer.deliver_later!()
  end
end
