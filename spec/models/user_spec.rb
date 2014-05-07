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
    it {should have_many(:recipes)}
    it {should have_many(:recipes).through(:user_recipes)}
  end

  context "Comparing pantry with database" do
    let(:user){FactoryGirl.create(:user)}
    let(:ingredient){FactoryGirl.create(:ingredient)}
    let(:recipe){FactoryGirl.create(:recipe)}
    recipe_all = []
    4.times do 
      recipe_all << FactoryGirl.create(:recipe)
    end
    let(:recipes) {recipe_all}

    before(:each) do
      user.ingredients << ingredient
    end

    context "#{}sort_recipes_by_ingredients"
      it "should return a hash with" do
        expect(user.sort_recipes_by_ingredients(recipes, 4)).to be_a Hash
      end

    it "should return a hash with #sort_recipes_by_percentage(top_recipes_hash)" do
      expect(user.sort_recipes_by_percentage({})).to be_an Array
    end

  end

end