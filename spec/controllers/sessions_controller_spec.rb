require 'spec_helper'

describe SessionsController do 
  let(:user) { FactoryGirl.create :user }
  context "#create session" do
    it "should find correct user" do
      expect {
        post :create,email: user.email, password: user.password 
        }.to change { session[:user_id] }
      end
    end


    it "should not log in with invalid params" do 
      expect {
        post :create, email: "something", password: "153"
      }.not_to change { session[:user_id] }
    end

    context "#destroy" do
      it "should log a user out" do
       stub_current_user(user)
       delete :destroy, id: user.id
       expect(session[:user_id]).to eq(nil)
     end
   end
 end