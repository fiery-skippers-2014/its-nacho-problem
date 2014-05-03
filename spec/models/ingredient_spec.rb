require 'spec_helper'

describe Ingredient do
  context "validations" do 
    it {should have_db_column(:name)}
    it {should validate_presence_of(:name)}
    it {should validate_uniqueness_of(:name)}
  end

  context "associations" do 
    it {should have_many(:user_ingredients)}
    it {should have_many(:users).through(:user_ingredients)}
  end
end