class RecipesController < ApplicationController
  before_filter :create do |controller|
    controller.instance_eval do 
      yummly_search_result
      fetch_name(list)
      fetch_id(list)
      fetch_url(list)
    end
  end


  def create
    new_recipe = Recipe.create(name: @recipe_name, img_url: @recipe_url, recipe_url: "Whatever_url", components: "some_components" )
  end


  def yummly_search_result
    result = Yummly.search('Bacon')
    recipe_list = result.matches
  end

  def fetch_name(list)
    recipe_names = list.map do |recipe|
      @recipe_name = recipe["recipeName"]
    end 
  end

  def fetch_id(list)
    recipe_id = list.map do |recipe|
      @recipe_id = recipe["id"]
    end
  end

  def fetch_url(list)
    recipe_url = list.map do |recipe|
      @recipe_url = recipe["smallImageUrls"]
    end
  end

end

# 1.Take json object with method in the model
# 2.Pass those results to a method that parses that data into what we need
# 3.Create a new Recipe object based on that data.