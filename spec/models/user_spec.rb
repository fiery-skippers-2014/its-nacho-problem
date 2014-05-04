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
    let(:recipe){FactoryGirl.create(:recipe)}

    before(:each) do
      user.ingredients << ingredient
    end

    it "should return an array with #get_name" do 
      expect(user.get_name).to be_an Array 
    end

    it "should return an hash with #get_keyword " do 
      expect(user.get_keyword).to be_a Hash
    end

    it "should return a hash with #find_recipe_by_pantry" do
      expect(user.find_recipe_by_pantry).to be_a Hash
    end
    
    it "should return a hash with #find_recipe_by_pantry" do
      expect(user.find_recipe_by_pantry).to be_a Hash
    end
  end

end