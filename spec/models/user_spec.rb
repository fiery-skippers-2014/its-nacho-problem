require 'spec_helper'

describe User do 

  context "Validations" do 
    it {should validate_presence_of :password}
    it {should validate_presence_of :email}
    it {should validate_uniqueness_of :email}
  end

  context "Associations" do 
    it {should have_many(:user_ingredients)}
    it {should have_many(:ingredients).through(:user_ingredients)}
  end

  context "Comparing pantry with database" do 
    let(:user){FactoryGirl.create(:user)}
    let(:ingredient){FactoryGirl.create(:ingredient)}
    let(:user_with_ingredients) {FactoryGirl.create(:user_with_ingredients, :user_id => user.id, :ingredient_id => ingredient.id)}
    it "should return an array with get_name" do 
      expect(user.get_name).to  be_an Array  
    end
  end

end