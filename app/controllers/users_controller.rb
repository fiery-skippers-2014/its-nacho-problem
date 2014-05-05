class UsersController < ApplicationController

  def index
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
        render 'index'
      end
    else
      flash[:error] = "Passwords must match!"
      render 'index'
    end
  end

  def update
    @user = current_user
      if @user.save!
        params[:ingredient_ids].length.times do |index|
          @user.ingredients << Ingredient.find(params[:ingredient_ids][index])
        end
        
      end
      render :partial => "ingredients/user_pantry"
    # rescue   
    #   flash[:error] = "You already have that ingredient!"
  end

  def destroy
    current_user.ingredients.find(params[:id]).destroy
    redirect_to user_ingredients_path(current_user)
  end

end