class IngredientsController < ApplicationController

  def index
    @user = current_user
    if @user
      @search = params[:search]
      @ingredients = Ingredient.search(@search)
    end
  end

  def new
    @user = current_user
  end

end
