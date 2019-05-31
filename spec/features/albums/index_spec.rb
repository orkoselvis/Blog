require 'rails_helper'

RSpec.feature 'Article list' do
  scenario 'Unauthenticated user' do
    visit articles_path
    within '#content' do
      expect(page).to have_content('List of all Articles')
    end
  end

  scenario 'Read my Blog button' do
    visit root_path
    expect(page).to have_link("Read My Blog")
  end

  scenario 'First Name field' do
    visit root_path
    expect(page).to have_field("First Name")
  end

  scenario "Last Name field" do
    visit root_path
    expect(page).to have_field("Last Name")
  end
end
