require 'spec_helper'

describe UserRecipe do
  context 'Associations' do
    it {should belong_to :recipe}
    it {should belong_to :user}
  end

  context 'Validations' do
    it{should validate_uniqueness_of(:recipe_id).scoped_to(:user_id)}
  end
end
