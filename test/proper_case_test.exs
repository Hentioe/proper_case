defmodule ProperCaseTest do
  use ExUnit.Case

  test ".to_camel_case converts a maps key to `camelCase`" do
    incoming = %{
      "user" => %{
        "first_name" => "Han",
        "last_name" => "Solo",
        "allies_in_combat" => [
          %{"name" => "Luke", "weapon_of_choice" => "lightsaber"},
          %{"name" => "Chewie", "weapon_of_choice" => "bowcaster"},
          %{"name" => "Leia", "weapon_of_choice" => "blaster"}
        ]
      }
    }
    expected = %{
      "user" => %{
        "firstName" => "Han",
        "lastName" => "Solo",
        "alliesInCombat" => [
          %{"name" => "Luke", "weaponOfChoice" => "lightsaber"},
          %{"name" => "Chewie", "weaponOfChoice" => "bowcaster"},
          %{"name" => "Leia", "weaponOfChoice" => "blaster"}
        ] 
      }
    } 

    assert ProperCase.to_camel_case(incoming) === expected
  end

  test ".camel_case_key camel cases a string" do
    assert ProperCase.camel_case_key("chewie_were_home") === "chewieWereHome"
  end

  test ".camel_case_key converts an atom to a string and camel cases it" do
    assert ProperCase.camel_case_key(:no_i_am_your_father) === "noIAmYourFather"
  end

end
