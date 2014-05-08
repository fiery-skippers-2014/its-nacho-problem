require 'spec_helper'

feature "removing ingredient from pantry" do
  let!(:ingredient) {FactoryGirl.create :ingredient}
  let!(:user) {FactoryGirl.create :user}

  before(:each) do
    page.set_rack_session(:user_id => user.id)
    user.ingredients << ingredient
    visit user_ingredients_path(user)
  end

  scenario "a user can delete an item from their pantry" do
    click_on "x"
    expect(page).not_to have_content(ingredient)
  end
end