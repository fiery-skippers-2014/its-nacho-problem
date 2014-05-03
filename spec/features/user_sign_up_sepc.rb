require 'spec_helper'

feature 'user can sign up' do 
  let!(:user) {FactoryGirl.create :user}
  let!(:user_attr) {FactoryGirl.attributes_for :user}  

  scenario "able to see sign up page when logged out" do
    visit root_path
    expect(page).to have_content('Password confirmation')
  end
end