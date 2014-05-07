class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
    if logged_in?
      redirect_to user_ingredients_path(current_user)
    end
  end

  def create
    # If I remove the 'password == password_confirmation' line, it allows users to sign up with invalid info/unmatched passwords! See user_sign_up_spec.rb
    if params[:password] == params[:password_confirmation]
      user = User.new params[:user]
      user.password = params[:password]
      if user.save
        session[:user_id] = user.id
        is_admin?
        redirect_to user_ingredients_path(user)
      else
        flash[:error] = user.errors.full_messages.join(' : ')
        redirect_to root_path
      end
    else
      flash[:error] = "Passwords must match!"
      redirect_to root_path
    end
  end

  def update
      if current_user.save
        params[:ingredient_ids].length.times do |index|
          current_user.ingredients << Ingredient.find(params[:ingredient_ids][index])
        end
      end
      render :partial => "ingredients/user_pantry"
  end

  def show
    @user_favorites = current_user.recipes.page(params[:page]).per(9)
  end

  def favorite_recipe
    current_user.recipes << Recipe.find(params[:recipe_id])
    redirect_to user_path(current_user)
  end

  def destroy
    current_user.ingredients.destroy(params[:id])
    render :partial => "ingredients/user_pantry"
  end
end