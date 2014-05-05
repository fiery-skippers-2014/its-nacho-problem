require 'spec_helper'

describe UserIngredient do

  context "Associations" do 
    it{should belong_to :user}
    it{should belong_to :ingredient}
  end

  context "validations" do
  	it{should validate_uniqueness_of(:ingredient_id).scoped_to(:user_id)}
  end
  
end