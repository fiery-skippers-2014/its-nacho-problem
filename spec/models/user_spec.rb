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
    recipe1 = Recipe.create(name: "Pie", components: ["apple", "crust", "salt", "sugar"], recipe_url: "something1")
    recipe2 = Recipe.create(name: "Sandwich", components: ["turkey", "apple", "salt", "sugar"], recipe_url: "something2")
    recipe3 = Recipe.create(name: "mac_and_cheese", components: ["pasta", "cheese", "salt", "sugar"], recipe_url: "something3")
    recipe4 = Recipe.create(name: "bats", components: ["fur", "claws", "ear", "sugar"], recipe_url: "something4")
    
    recipe_all = [recipe1, recipe2, recipe3, recipe4]

    

    let(:recipes) {recipe_all}

    before(:each) do
      user.ingredients = []
    end

    context "#{}sort_recipes_by_ingredients" do 

      it "should return a hash with" do
        expect(user.sort_recipes_by_ingredients(recipes, 4)).to be_a Hash
      end

      it "should return 4 recipes" do 
        expect(user.sort_recipes_by_ingredients(recipes, 3).length).to eq(3)
      end

    end

    it "should return a hash with #sort_recipes_by_percentage(top_recipes_hash)" do
      expect(user.sort_recipes_by_percentage({})).to be_an Array
    end

  end

end