require 'spec_helper'

feature "adding ingredient into pantry" do
	let!(:ingredient) {FactoryGirl.create :ingredient}
  let!(:user) {FactoryGirl.create :user}

  before(:each) do
    page.set_rack_session(:user_id => user.id)
    visit user_ingredients_path(user)
  end

  scenario "a user can add click on a checkbox for the ingredient" do
  	 fill_in 'search', with: ingredient.name
     click_on 'Search'
     find(:css, "input#ingredient_ids_").set(true)
     click_on "Add to pantry"
     expect(page).to have_content(ingredient.name)
  end
end