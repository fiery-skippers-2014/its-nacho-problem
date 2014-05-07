require 'spec_helper'

feature "user can favorite a recipe" do
  let!(:user) {FactoryGirl.create :user}
  let!(:recipe) {Recipe.create(name: 'Apple Pie', recipe_url: 'http://www.yummly.com/recipes/gala-apples-pie', components: ['apple', 'pie'])}

  before(:each) do
    page.set_rack_session(:user_id => user.id)
    user.recipes << recipe
  end

  scenario "a user can click on See More to toggle down the recipe info" do
    visit user_nachoresult_path(user)
    click_on 'See more'
    expect(page).to have_content('Recipe Needs')
  end

  scenario "a user can click on Add to favorites and add the recipe to their favorite list on their user profile page" do
    visit user_nachoresult_path(user)
    click_on 'Add to favorites'
    expect(page).to have_content('Favorite Recipes')
  end

  # scenario "a user can click on See Recipe on their favorite and go to the yummly recipe site" do
  #   visit favorite_recipe_users_path
  #   click_on "See more"
  #   click_on "See Recipe"
  #   expect(page).to have_content("Yummly")
  # end

  scenario "a user can visit their pantry from their favorites page" do
    visit favorite_recipe_users_path
    click_on "Your Pantry"
    expect(page).to have_content("#{user.username}'s Pantry")
  end

  scenario "a user can visit Nacho Problem from their favorites page" do
    visit favorite_recipe_users_path
    click_on "All Recipes"
    expect(page).to have_content("apple")
  end
end
