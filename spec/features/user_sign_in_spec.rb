require 'spec_helper'

feature "User Sign in" do 
  let!(:user) {FactoryGirl.create(:user)}

  scenario "a user can log in with valid params" do 
    visit root_path
    within 'div#log-in' do 
      fill_in 'Email',        :with => user.email
      fill_in 'Password',      :with => user.password
      click_on 'Log In'
    end
    expect(page).to have_content(user.username)
  end

  scenario "a user can't log in with invalid params" do 
    visit root_path
    within 'div#log-in' do 
      fill_in 'Email',        :with => "dog"
      fill_in 'Password',      :with => "password"
      click_on 'Log In'
    end
    expect(page).not_to have_content(user.username)
  end
end