require 'spec_helper'

feature "Admin" do 
  let!(:user) {User.create(username: "admin", email: "admin@admin.com",password: "123")}

  scenario "an admin can sign in" do 
    visit root_path
    within 'div#log-in' do 
      fill_in 'Email',        :with => user.email
      fill_in 'Password',      :with => user.password
      click_on 'Log In'
    end

    expect(page).to have_content("Admin")
  end
end