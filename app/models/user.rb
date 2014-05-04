class User < ActiveRecord::Base
  attr_accessible :email, :username, :password, :password_confirmation

  validates_presence_of :password, :email, :on => :create
  validates :email, :uniqueness => true

  has_many :user_ingredients
  has_many :ingredients, through: :user_ingredients

  has_secure_password

  def get_name
    self.ingredients.map do |obj|
      obj.name 
    end 
  end

  def get_keyword
    get_name.inject({}) {|hash, element| hash[element[0..[4, element.size].min]] = element; hash}
  end

  def find_recipe_by_pantry
    pantry_hashed = get_keyword
    found_recipes = {}
    Recipe.all.map do |recipe_obj|
      found_recipes[recipe_obj.name] = recipe_obj.components.reject {|recipe| pantry_hashed[recipe[0..4]] }
    end
    found_recipes
  end

  def sort_recipes_by_ingredients
    top_recipes = find_recipe_by_pantry.sort_by { |recipe_name, missing_ingredients| missing_ingredients.length }
    Hash[top_recipes.slice(0, 10)]
  end
end





