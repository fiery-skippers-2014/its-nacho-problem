require 'spec_helper'

feature 'searching for ingredient in serach bar' do
  let!(:ingredient) {Ingredient.create(name: 'apple')}
  let!(:user) {FactoryGirl.create :user}
  let!(:recipe) {Recipe.create(name: 'Apple Pie', recipe_url: 'www.applepie.com', components: ['apple', 'pie'])}

  before(:each) do
    page.set_rack_session(:user_id => user.id)
    user.ingredients << ingredient
  end

  scenario "a user will be shown recipes sorted by ingredients that they have" do
    visit user_ingredients_path(user)
    click_on 'Nacho Problem'
    expect(page).to have_content('Apple Pie')
  end

  scenario "a user will not be shown recipes for ingredients that they don't have" do
    visit user_ingredients_path(user)
    click_on 'Nacho Problem'
    expect(page).to_not have_content('Fried Chicken')
  end

  scenario "a user will be shown missing ingredients for each recipe" do
    visit user_ingredients_path(user)
    click_on 'Nacho Problem'
    expect(page).to have_content('Missing Ingredients: pie')
  end

  scenario "a user can click on See more to toggle down the rest of the recipe" do
    visit user_nachoresult_path(user)
    click_on "See more"
    expect(page).to have_content("See Recipe")
  end

  scenario "a user will be able to return to the pantry page from the Nacho page" do
    visit user_nachoresult_path(user)
    click_on "Back To Pantry"
    expect(page).to have_content("#{user.username}'s Pantry")
  end
end