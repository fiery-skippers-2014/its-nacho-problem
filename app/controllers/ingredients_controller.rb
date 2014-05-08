class IngredientsController < ApplicationController
  before_filter :authenticate!
  
  def search
    @search = params[:search]
    @ingredients = Ingredient.search(@search)
    render partial: 'search_results', locals: {ingredients: @ingredients}
  end

end
