defmodule Nlw05Elexir.WelcomerTest do
  use ExUnit.Case

  alias Nlw05Elexir.Welcomer

  describe "welcome/1" do
    test "when the user is special, returns a special message" do
      params = %{"name" => "banana", "age" => "42"}
      result = Welcomer.welcome(params)

      assert result == "banana"
    end
  end
end
