require 'spec_helper'
require 'support/authentication_helper'

feature 'user sign up' do
  let!(:user) {FactoryGirl.create :user}
  let!(:user_attr) {FactoryGirl.attributes_for :user}

  scenario "able to see sign up page when logged out" do
    visit root_path
    expect(page).to have_content('Password confirmation')
  end

  scenario "able to sign up with valid information" do
    visit root_path
    within 'div#sign-up' do
      fill_in 'Username',               :with => user_attr[:username]
      fill_in 'Email',                  :with => user_attr[:email]
      fill_in 'Password',               :with => user_attr[:password]
      fill_in 'Password confirmation',  :with => user_attr[:password]
      click_on 'Sign Up'
    end
    expect(page).to have_content(user_attr[:username])
  end

  scenario "not able to sign up with invalid information" do
    visit root_path
    within 'div#sign-up' do
      fill_in 'Username',               :with => user_attr[:username]
      fill_in 'Email',                  :with => user_attr[:email]
      fill_in 'Password',               :with => user_attr[:password]
      fill_in 'Password confirmation',  :with => user_attr["poop"]
      click_on 'Sign Up'
    end
    expect(page).to have_content("Passwords must match!")
  end

  # scenario "existing user can log in" do
  #   visit root_path
  #   within 'div#log-in' do
  #     fill_in 'Email',                  :with => "batman@batman.com"
  #     fill_in 'Password',               :with => "batman"
  #     click_on 'Log In'
  #   end
  #   expect(page).to have_content("Batman's Pantry")
  # end

  scenario "new user can not log in without signing up first" do
    visit root_path
    within 'div#log-in' do
      fill_in 'Email',                  :with => user_attr[:email]
      fill_in 'Password',               :with => user_attr[:password]
      click_on 'Log In'
    end
    expect(page).to have_content("Invalid email or password")
  end
end