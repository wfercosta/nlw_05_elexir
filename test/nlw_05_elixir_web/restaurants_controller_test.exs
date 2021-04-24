defmodule Nlw05ElixirWeb.RestaurantsControllerTest do
  use Nlw05ElixirWeb.ConnCase

  describe "create/2" do
    test "when all params are valid, creates a user", %{conn: conn} do
      # Arrange
      params = %{name: "Siri cascudo", email: "siri@cascudo.com"}

      # Act
      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:created)

      # Assertions
      assert %{
               "message" => "Restaurant created!",
               "restaurant" => %{
                 "email" => "siri@cascudo.com",
                 "id" => _id,
                 "name" => "Siri cascudo"
               }
             } = response
    end

    test "when there are invalid params, returns a error", %{conn: conn} do
      # Arrange
      params = %{email: "siri@cascudo.com"}

      expected_response = %{"message" => %{"name" => ["can't be blank"]}}

      # Act
      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:bad_request)

      # Assertions
      assert response == expected_response
    end
  end
end
