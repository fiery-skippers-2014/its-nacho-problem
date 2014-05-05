require 'spec_helper'

feature "removing ingredient from pantry" do
  let!(:ingredient) {Ingredient.create(name: 'apple')}
  let!(:user) {FactoryGirl.create :user}

  before(:each) do
    page.set_rack_session(:user_id => user.id)
    user.ingredients << ingredient
    visit user_ingredients_path(user)
  end

  scenario "a user can add click on a checkbox for the ingreident" do
    click_on "x"
    expect(page).not_to have_content('apple')
  end
end