class AdminsController < ApplicationController

  def yummly_search_result(user_pantry, max_results)
    result = Yummly.search(user_pantry, max_results)
    result.matches
  end

  def create
    api_result = yummly_search_result(params["/admins"]["ingredient"], {maxResult: params["/admins"]["max_result"]}) #=> hard coded, change ingredient and number of recipes
    api_result.length.times do
      Recipe.create(new_recipe_from_yummly(api_result))
      new_recipe_from_yummly(api_result)[:components].each do |ingredient|
        Ingredient.create(name: ingredient)
      end
      api_result.pop
    end
    redirect_to admins_path
  end

end