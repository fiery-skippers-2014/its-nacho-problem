class RecipesController < ApplicationController


  def yummly_search_result(user_pantry, max_results)
    result = Yummly.search(user_pantry, max_results)
    result.matches
  end

  def show
    @top_recipes = current_user.sort_recipes_by_ingredients
    @recipe_objects = []
    @top_recipes.each_key {|recipe_name| @recipe_objects << Recipe.find_by_name(recipe_name)}
  end

  def create
    api_result = yummly_search_result('chicken', {maxResult: 1000})
    api_result.length.times do
      Recipe.create(new_recipe_from_yummly(api_result))
      new_recipe_from_yummly(api_result)[:components].each do |ingredient|
        Ingredient.create(name: ingredient)
      end
      api_result.pop
    end
    # @top_recipes = current_user.sort_recipes_by_ingredients
    # redirect_to user_

    # render nothing: true #REMEMBER TO TAKE THIS OUT; ONLY FOR TEST PURPOSES
  end

end

# 1.Take json object with method in the model
# 2.Pass those results to a method that parses that data into what we need
# 3.Create a new Recipe object based on that data.
