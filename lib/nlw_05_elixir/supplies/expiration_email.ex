defmodule Nlw05Elixir.Supplies.ExpirationEmail do
  import Bamboo.Email

  alias Nlw05Elixir.Supply

  def create(to_email, supplies) do
    new_email(
      to: to_email,
      from: "app@nlw05elixir.com.br",
      subject: "Supplies that ar about to expire",
      text_body: email_text(supplies)
    )
  end

  defp email_text(supplies) do
    initial_text = "--------- Supplies that are about to expire: ----------- \n"

    Enum.reduce(supplies, initial_text, fn supply, text -> text <> supply_string(supply) end)
  end

  defp supply_string(%Supply{
         description: description,
         expiration_date: expiration_date,
         responsible: responsible
       }) do
    "Description: #{description}, Expiration Date: #{expiration_date}, Responsible: #{responsible} \n"
  end
end
