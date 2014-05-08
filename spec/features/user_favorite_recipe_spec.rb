require 'spec_helper'

feature "user can favorite a recipe" do
  let!(:user) {FactoryGirl.create :user}
  let!(:recipe) {FactoryGirl.create :recipe}

  before(:each) do
    page.set_rack_session(:user_id => user.id)
    visit user_nachoresult_path(user)
  end

  scenario "a user can click on See More to toggle down the recipe info" do
    click_on 'See more'
    expect(page).to have_content('Recipe Needs')
  end

  scenario "a user can click on Add to favorites and add the recipe to their favorite list on their user profile page" do
    click_on 'Add to favorites'
    expect(page).to have_content('Favorite Recipes')
    expect(page).to have_content(recipe.name)
  end
end
