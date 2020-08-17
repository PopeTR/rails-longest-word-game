require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  test "Going to /new gives us a new random grid to play with" do
    visit new_url
    assert test: "New game"
    assert_selector ".card", count: 10
  end

  test "fill the form with a random word, and get a message that the word is not in the grid." do
    visit new_url
    fill_in "score", with: "Chocolate"
    click_on "PLAY"

    assert_text "Sorry but #{@word} can't be built out of #{@letters}"
  end



end
