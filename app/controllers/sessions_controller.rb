class SessionsController < ApplicationController

  def new
    render 'ingredients'
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_ingredients_path
    else
      flash.alert = "Invalid email or password"
      render 'index'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end