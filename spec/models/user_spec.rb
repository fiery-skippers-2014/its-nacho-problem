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
    let!(:user){FactoryGirl.create(:user)}
    before(:each) do 
      @recipes = []
      ingredients = []
      4.times do 
        @recipes << FactoryGirl.create(:recipe)
        ingredients << FactoryGirl.create(:ingredient)
      end
      user.ingredients = ingredients
      user.save
    end
    

    context "#sort_recipes_by_ingredients" do 

      it "should return a hash with" do
        expect(user.sort_recipes_by_ingredients(@recipes, 4)).to be_a Hash
      end

      it "should return 4 recipes" do 
        expect(user.sort_recipes_by_ingredients(@recipes, 3).length).to eq(3)
      end

      it "should sort the hash of recipes by the least missing ingredients" do 
        expect(user.sort_recipes_by_ingredients(@recipes,1)).to eq({@recipes[0].name => []})
      end

    end
    
    context "#sort_recipes_by_percentage" do 
      let(:top_recipes) {user.sort_recipes_by_ingredients(@recipes, 1)}

      it "should return a hash with #sort_recipes_by_percentage(top_recipes_hash)" do
        expect(user.sort_recipes_by_percentage(top_recipes)).to be_an Array
      end

      it "sorts the recipes by percentage of ingredients missing" do 
        expect(user.sort_recipes_by_percentage(top_recipes)).to eq([[100,@recipes[0]]])
      end


    end

  end

end