require 'spec_helper'

feature 'searching for ingredient in serach bar' do
  let!(:ingredient) {Ingredient.create(name: 'apple')}
  let!(:user) {FactoryGirl.create :user}
  let!(:recipe) {Recipe.create(name: 'Apple Pie', recipe_url: 'www.applepie.com', components: ['apple', 'pie'])}

  before(:each) do
    page.set_rack_session(:user_id => user.id)
    user.ingredients << ingredient
    visit user_ingredients_path(user)
  end

  scenario "a user will be shown recipes sorted by ingredients that they have" do
    click_on 'Nacho Problem'
    expect(page).to have_content('Apple Pie')
  end  

  scenario "a user will be shown missing ingredients for each recipe", js: true do
    click_on 'Nacho Problem'
    debugger
    expect(page).to have_content('Missing Ingredients: ["pie"]')
  end
end