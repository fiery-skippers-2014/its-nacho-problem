require 'spec_helper'
include AuthenticationHelper

describe UsersController do
  let(:user_atts) { FactoryGirl.attributes_for :user }
  let(:pass) { Faker::Internet.password }
  let(:user) {FactoryGirl.create :user}
  let(:ingredient) {FactoryGirl.create :ingredient}

  
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

  context "#update" do
    it "updates with valid attributes" do
      stub_current_user(user)
      expect { put :update, :id => user.id, :ingredient_ids => [ingredient.id]
      }.to change {user.ingredients.count}.by(1)
    end
  end

  context "#destroy" do
    it "deletes an ingredient" do
      stub_current_user(user)
      user.ingredients << ingredient
      expect { 
        delete :destroy, :id => user.id, :ingredient_id => ingredient.id
        }.to change {user.ingredients.count}.by(-1)
    end

  end
end