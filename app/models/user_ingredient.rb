class UserIngredient<ActiveRecord::Base
  belongs_to :user
  belongs_to :ingredient  
  attr_accessible :ingredient_ids, :ingredient_id, :user_id
	validates_uniqueness_of :ingredient_id, :scope => :user_id  
 
  
end