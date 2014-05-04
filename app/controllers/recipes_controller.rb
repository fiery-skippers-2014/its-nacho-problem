class RecipesController < ApplicationController


  def yummly_search_result(user_pantry, max_results)
    result = Yummly.search(user_pantry, max_results)
    result.matches
  end

  def create
    @top_recipes = User.first.sort_recipes_by_ingredients

    if @top_recipes == nil
      api_result = yummly_search_result('bacon', {maxResult: 10})
      api_result.length.times do
        Recipe.create(new_recipe_from_yummly(api_result))
        new_recipe_from_yummly(api_result)[:components].each do |ingredient|
          Ingredient.create(name: ingredient)
        end
        api_result.pop
      end
      @top_recipes = User.first.sort_recipes_by_ingredients
    end

    
    render nothing: true #REMEMBER TO TAKE THIS OUT; ONLY FOR TEST PURPOSES
  end

end

# 1.Take json object with method in the model
# 2.Pass those results to a method that parses that data into what we need
# 3.Create a new Recipe object based on that data.
