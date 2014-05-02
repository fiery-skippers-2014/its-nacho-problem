require 'spec_helper'

describe Recipe do
  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:components)}
  it {should validate_presence_of(:recipe_url)}
  it {should validate_uniqueness_of(:name)}
  it {should validate_uniqueness_of(:recipe_url)}

  context "appending the id to url" do 
    it "should append the recipe_id to the url" do 
      id = [1]
      expect(recipe_url_assembler(id)).to eq(["http://www.yummly.com/recipe/1"])
    end
  end
end