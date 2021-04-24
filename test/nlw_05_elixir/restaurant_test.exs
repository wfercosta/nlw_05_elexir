defmodule Nlw05Elixir.RestaurantTest do
  use Nlw05Elixir.DataCase

  alias Ecto.Changeset
  alias Nlw05Elixir.Restaurant

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      # Arranges
      params = %{email: "siri@cascudo.com", name: "Siri cascudo"}

      # Act
      response = Restaurant.changeset(params)

      # Assert
      assert %Changeset{changes: %{email: "siri@cascudo.com", name: "Siri cascudo"}, valid?: true} =
               response
    end

    test "when all params are invalid, returns an error" do
      # Arrange
      params = %{email: "any", name: "A"}

      expected_errors = %{
        email: ["has invalid format"],
        name: ["should be at least 2 character(s)"]
      }

      # Act
      response = Restaurant.changeset(params)

      # Asset
      assert %Changeset{valid?: false} = response
      assert errors_on(response) == expected_errors
    end
  end
end
