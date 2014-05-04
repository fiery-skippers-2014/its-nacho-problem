require 'spec_helper'

feature 'user sign up' do 
  let!(:user) {FactoryGirl.create :user}
  let!(:user_attr) {FactoryGirl.attributes_for :user}  

  scenario "able to see sign up page when logged out" do
    visit root_path
    expect(page).to have_content('Password confirmation')
  end

  scenario "able to sign up" do
    visit root_path
    within 'div.sign-up' do
      fill_in 'Username',               :with => user_attr[:username]
      fill_in 'Email',                  :with => user_attr[:email]
      fill_in 'Password',               :with => user_attr[:password]
      fill_in 'Password confirmation',  :with => user_attr[:password]
    end
      click_on 'Submit'

    expect(page).to have_content(user_attr[:username])

  end
end