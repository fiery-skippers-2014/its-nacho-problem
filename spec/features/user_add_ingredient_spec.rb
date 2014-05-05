require 'spec_helper'

feature "adding ingredient into pantry" do
	let!(:ingredient) {Ingredient.create(name: 'apple')}
  let!(:user) {FactoryGirl.create :user}

  before(:each) do
    page.set_rack_session(:user_id => user.id)
    visit user_ingredients_path(user)
  end

  scenario "a user can add click on a checkbox for the ingreident" do
  	 fill_in 'search', with: 'apple'
     click_on 'Search'
     find(:css, "input#ingredient_ids_").set(true)
     click_on "Update User"
     expect(page).to have_content('apple')
  end
end