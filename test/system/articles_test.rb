require "application_system_test_case"

class ArticlesTest < ApplicationSystemTestCase
  test "viewing the root page" do
    visit root_path
    assert_selector "h1", text: "Welcome to my Blog"
  end

  test "login as a user" do
    visit root_path
    click_on "Sign In"
    fill_in "Input User ID", with: "orko"
    fill_in "Input Password", with: "1234567"
    click_button"Sign In"
    click_on "Blog"
    click_on "Create New Article"
    fill_in "Title", with: "Some title :)"
    fill_in "Text", with: "And here is description :)"
    click_on "Choose your category"
    click_on "Movie"
    click_on "Save Article"
    assert_selector "p", text: "Article was successfully created!"
  end

end
