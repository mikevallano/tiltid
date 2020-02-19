require 'rails_helper'

RSpec.feature "home feature spec", type: :feature do
  feature 'User can visit homepage' do
    scenario 'they see something on the page', js: true do
      visit root_path

      expect(page).to have_content('My foobar')
    end
  end
end
