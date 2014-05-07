class IngredientsController < ApplicationController
  before_filter :authenticate!

  def search
    @ingredients = Ingredient.search(params[:search])
    render partial: 'search_results', locals: {ingredients: @ingredients}
  end
end