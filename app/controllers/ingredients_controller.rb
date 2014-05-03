class IngredientsController < ApplicationController

  def index
    @search = params[:search]
    @ingredients = Ingredient.search(@search)
  end

  def new
  end

  def create
    render :index
  end

end
