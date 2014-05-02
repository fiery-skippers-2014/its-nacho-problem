class RecipesController < ApplicationController

  def yummly_search_result(user_pantry)
    result = Yummly.search(user_pantry)
    result.matches
  end

  def create
    api_result = yummly_search_result('steak, pepper')
    api_result.length.times do
      Recipe.create(new_recipe_from_yummly(api_result))
      api_result.pop
    end
  end

end