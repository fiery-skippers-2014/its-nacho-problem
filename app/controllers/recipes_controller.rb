class RecipesController < ApplicationController



  def yummly_search_result
    result = Yummly.search('Bacon')
    result.matches
  end

  def fetch_name
    recipe_names = yummly_search_result.map do |recipe|
      recipe["recipeName"]
    end 
  end

end