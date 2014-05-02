class Recipe < ActiveRecord::Base
  serialize :components
  attr_accessible :components, :name, :recipe_url, :img_url

  validates_presence_of :name, :recipe_url, :components
  validates_uniqueness_of :name, :recipe_url
end

def recipe_url_assembler(recipe_id_array)
  recipe_id_array.map! do |recipe_id|
    "http://www.yummly.com/recipe/#{recipe_id}"
  end
end

