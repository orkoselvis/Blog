require 'rails_helper'

RSpec.feature 'Article list' do
  scenario 'unauthenticated user' do
    visit articles_path
    within '#content' do
      expect(find(h1)).to have_content('List of all Articles')
    end
  end
end
