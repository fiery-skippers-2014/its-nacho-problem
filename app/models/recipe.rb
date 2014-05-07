class Recipe < ActiveRecord::Base
  serialize :components
  attr_accessible :components, :name, :recipe_url, :img_url

  validates_presence_of :name, :recipe_url, :components
  validates_uniqueness_of :name, :recipe_url

  has_many :user_recipes
  has_many :users, through: :user_recipes

end

  def new_recipe_from_yummly(api_result)
    recipe_name = ''
    recipe_url = ''
    recipe_img_url = ''
    recipe_components = []

    recipe = api_result.map do |recipe|
      recipe_name = recipe["recipeName"]
      recipe_url = "http://www.yummly.com/recipe/#{recipe['id']}"
      recipe_img_url = recipe["smallImageUrls"][0]
      recipe_components = recipe['ingredients']
    end
    api_params = {name: recipe_name, recipe_url: recipe_url, img_url: recipe_img_url, components: recipe_components}
  end


