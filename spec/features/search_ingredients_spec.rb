require 'spec_helper'

feature 'searching for ingredient in serach bar' do
  let!(:ingredient) {FactoryGirl.create :ingredient}
  let!(:user) {FactoryGirl.create :user}

  before(:each) do
    page.set_rack_session(:user_id => user.id)
    visit user_ingredients_path(user)
  end


  scenario "a user can search for existing ingredients" do
    fill_in 'search', with: ingredient.name
    click_on 'Search'
    expect(page).to have_content(ingredient.name)
  end

  scenario "a user can search for existing ingredients" do
    fill_in 'search', with: ingredient.name
    click_on 'Search'
    expect(page).not_to have_content("poop")
  end
end