class SessionsController < ApplicationController

  def new
    render 'ingredients'
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if is_admin?
        redirect_to admins_path
      else
        redirect_to user_ingredients_path(user)
      end
    else
      flash[:error] = "Invalid email or password"
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end