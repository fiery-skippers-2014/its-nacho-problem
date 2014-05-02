class IngredientsController < ApplicationController

  def new
  end

  def create
    render :index
  end

  def search
    @ingredients = Ingredient.search(params[:search] )      # calling the search method from the ingredients model
  end
end