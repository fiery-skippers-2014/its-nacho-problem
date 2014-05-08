class User < ActiveRecord::Base
  attr_accessible :email, :username, :password, :password_confirmation

  validates_presence_of :password, :email, :on => :create
  validates :email, :uniqueness => true

  has_many :user_ingredients
  has_many :ingredients, through: :user_ingredients

  has_many :user_recipes
  has_many :recipes, through: :user_recipes

  has_secure_password

  def sort_recipes_by_ingredients(recipe_data, number_of_recipes)
    top_recipes = find_recipe_by_pantry(recipe_data).sort_by { |recipe_name, missing_ingredients| missing_ingredients.length }
    Hash[top_recipes.slice(0, number_of_recipes)]
  end
  
  
  def sort_recipes_by_percentage(top_recipes_hash)
    by_percent = get_percentage_of_missing_ingredients(top_recipes_hash).zip(find_top_recipes_in_db(top_recipes_hash))
    by_percent.sort_by { |recipe| recipe[0]}.reverse!
  end

  private

  def find_recipe_by_pantry(recipe_data)
    pantry_hashed = assign_ingredient_to_keyword
    found_recipes = {}
    recipe_data.map do |recipe_obj|
      found_recipes[recipe_obj.name] = recipe_obj.components.reject {|recipe| pantry_hashed[recipe[0..4]] }
    end
    found_recipes
  end

  def assign_ingredient_to_keyword
    get_user_ingredient_names.inject({}) {|hash, element| hash[element[0..[4, element.size].min]] = element; hash}
  end

  def get_user_ingredient_names
    self.ingredients.map do |obj|
      obj.name
    end
  end

  def find_top_recipes_in_db(top_recipes_hash)
    recipe_objects = []
    top_recipes_hash.each_key {|recipe_name| recipe_objects << Recipe.find_by_name(recipe_name)}
    recipe_objects
  end

  def get_percentage_of_missing_ingredients(top_recipes_hash)
    find_top_recipes_in_db(top_recipes_hash).map do |recipe|
      (100 - ((top_recipes_hash["#{recipe.name}"].length / recipe.components.length.to_f) * 100)).round(2)
    end
  end

end





