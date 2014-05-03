class IngredientsController < ApplicationController

  def index
    @search = params[:search]
    @ingedients = Ingredient.search(@search)
  end

  def new
  end

  def create
    render :index   #TODO allow a user to add items to the ingredients database?
  end

end
