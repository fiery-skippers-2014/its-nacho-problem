require 'spec_helper'

feature 'searching for ingredient in serach bar' do
  let!(:ingredient) {Ingredient.create(name: 'apple')}
  let!(:user) {FactoryGirl.create :user}

  before(:each) do
    page.set_rack_session(:user_id => user.id)
    visit user_ingredients_path(user)
  end

  scenario "a user can search for existing ingredients"
    fill_in 'search', with: 'apple'
    click_on 'Search'
    expect(page).to have_content('apple')
  end

  scenario "a user can search for existing ingredients"
    fill_in 'search', with: 'poop'
    click_on 'Search'
    expect(page).not_to have_content('poop')
  end
end