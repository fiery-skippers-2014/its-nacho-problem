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
        flash.alert = user.errors.full_messages.join(' : ')
        render 'index'
      end
    else
      flash.alert = "Passwords must match!"
      render 'index'
    end
  end

  def update
    @user = current_user
    if @user.save
      flash[:notice] = "Your food has been saved!"
      params[:ingredient_ids].length.times do |index|
        @user.ingredients << Ingredient.find(params[:ingredient_ids][index])
      end
    redirect_to user_ingredients_path(@user)
    else
      redirect_to user_ingredients_path(@user), :flash => {:error => "blah"}
    end
  end

  def destroy
    p '$' * 100
    p params
    p '$' * 100
    current_user.ingredients.find(params[:id]).destroy
    redirect_to user_ingredients_path(current_user)
  end

end