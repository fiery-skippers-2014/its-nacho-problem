class IngredientsController < ApplicationController

  def index
    @user = current_user
    if @user
      @search = params[:search]
      @ingredients = Ingredient.search(@search)
    end
  end

  def new
  end

  def create
    @user = current_user
  end

end
