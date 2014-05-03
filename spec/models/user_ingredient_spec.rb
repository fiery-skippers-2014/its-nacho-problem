require 'spec_helper'

describe UserIngredient do

  context "Associations" do 
    it{should belong_to :user}
    it{should belong_to :ingredient}
  end


  
end