class IngredientsController < ApplicationController

  def index
    @search = params[:search]
    @ingredients = Ingredient.all(:conditions => ['name LIKE ?', "%#{@search}%"])
  end

  def new
  end

  def create
    render :index
  end

end




  # def self.search(search)
  #   if search
  #     find(:all, :conditions => ['name LIKE ?', "%#{search}%"])   # Added wildcards to both sides of the search field, so that a search for cheese will also return 'creamcheese', 'cheesecake' and 'cheddar cheese'
  #   else
  #     find(:all)
  #   end
  # end