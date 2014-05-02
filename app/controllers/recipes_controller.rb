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
    new_recipe = Recipe.create(name: @recipe_name, image_url: @recipe_url, recipe_url: "http://www.yummly.com/recipes/", )
  end


  def yummly_search_result('Bacon')
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