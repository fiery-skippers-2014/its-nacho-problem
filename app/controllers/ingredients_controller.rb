class IngredientsController < ApplicationController
  before_filter :authenticate!
  def index
  end

  def search
    @search = params[:search]
    @ingredients = Ingredient.search(@search)
    render partial: 'search_results', locals: {ingredients: @ingredients}
  end

  def new
  end

  def create
    @user = current_user
  end
end