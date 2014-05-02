require 'spec_helper'

describe UsersController do
  let(:user_atts) { FactoryGirl.attributes_for :user }
  let(:pass) { Faker::Internet.password }
  context "#create" do
    it "creates a user when the entered passwords match" do
      init_hash = { password: pass, password_confirmation: pass, user: user_atts }
      expect {
        post :create, init_hash
      }.to change { User.count }.by(1)
    end

    it "fails to create a user when the passwords don't match" do
      init_hash = { password: pass, password_confirmation: pass.upcase, user: user_atts }
      expect {
        post :create, init_hash
      }.to change { User.count }.by(0)
    end
  end
end