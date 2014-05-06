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
    it {should have_many_and_belong_to (:recipes)}

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

    it "should return a hash with #sort_recipes_by_ingredients(number_of_recipes)" do
      expect(user.sort_recipes_by_ingredients(1)).to be_a Hash
    end

    it "should return a hash with #find_top_recipes_in_db(top_recipes_hash)" do
      expect(user.find_top_recipes_in_db({})).to be_an Array
    end

    it "should return a hash with #get_percentage_of_missing_ingredients(top_recipes_hash)" do
      expect(user.get_percentage_of_missing_ingredients({})).to be_an Array
    end

    it "should return a hash with #sort_recipes_by_percentage(top_recipes_hash)" do
      expect(user.sort_recipes_by_percentage({})).to be_an Array
    end

  end

end