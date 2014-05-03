class IngredientsController < ApplicationController

  def index
    @user = current_user
    if @search
      @search = params[:search]
      @ingredients = Ingredient.search(@search)
    end
  end

  def new
  end

  def create
    render :index   #TODO allow a user to add items to the ingredients database?
  end

end
