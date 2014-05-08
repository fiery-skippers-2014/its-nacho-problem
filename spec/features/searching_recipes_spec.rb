require 'spec_helper'

feature 'searching for ingredient in serach bar' do
  let!(:ingredient) {FactoryGirl.create :ingredient}
  let!(:user) {FactoryGirl.create :user}
  let!(:recipe) {FactoryGirl.create :recipe}

  before(:each) do
    page.set_rack_session(:user_id => user.id)
    user.ingredients << ingredient
    visit user_ingredients_path(user)
  end

  scenario "a user will be shown recipes sorted by ingredients that they have" do
    click_on 'Nacho Problem'
    expect(page).to have_content(ingredient.name)
  end  

  scenario "a user will be shown recipes ingredients" do
    click_on 'Nacho Problem'
    expect(page).to have_content(recipe.name)
  end
end