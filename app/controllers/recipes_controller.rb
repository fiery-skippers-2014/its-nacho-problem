class RecipesController < ApplicationController

  def show
    @user = current_user
    @top_recipes = current_user.sort_recipes_by_ingredients(45) #=> hard coded, changes number of recipes
    @recipe_objects = current_user.sort_recipes_by_percentage(@top_recipes)
    @paginatable_array = Kaminari.paginate_array(@recipe_objects).page(params[:page]).per(9)
  end

end