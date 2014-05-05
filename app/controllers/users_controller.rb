class UsersController < ApplicationController

  def index
    #redirect_to user_ingredients_path(user)
  end

  def new
    @user = User.new
  end

  def create
    if params[:password] == params[:password_confirmation]
      user = User.new params[:user]
      user.password = params[:password]
      if user.save
        session[:user_id] = user.id
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
    @user = current_user
      if @user.save!
        params[:ingredient_ids].length.times do |index|
          @user.ingredients << Ingredient.find(params[:ingredient_ids][index])
        end
        redirect_to user_ingredients_path(@user)
      end
    rescue
      flash[:error] = "You already have that ingredient!"
      redirect_to user_ingredients_path(@user)
  end

  def destroy
    current_user.ingredients.find(params[:id]).destroy
    redirect_to user_ingredients_path(current_user)
  end

end