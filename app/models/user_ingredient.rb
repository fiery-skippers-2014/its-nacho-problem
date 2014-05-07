class UserIngredient<ActiveRecord::Base
  belongs_to :user
  belongs_to :ingredient
	validates_uniqueness_of :ingredient_id, :scope => :user_id
end