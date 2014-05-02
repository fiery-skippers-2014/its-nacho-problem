class RecipesController < ApplicationController

  def yummly_search_result
    result = Yummly.search('Bacon')
    recipe_list = result.matches
  end

  def fetch_name(list)
    recipe_names = list.map do |recipe|
      recipe["recipeName"]
    end 
  end 

  def fetch_id(list)
    recipe_id = list.map do |recipe|
      "http://www.yummly.com/recipe/#{recipe['id']}" 
    end 
  end

  def fetch_url(list)
    recipe_url = list.map do |recipe|
      recipe["smallImageUrls"]
    end
  end

  def fetch_components(list)
    recipe_url = list.map do |recipe|
      recipe["ingredients"]
    end
  end

end