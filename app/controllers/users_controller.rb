class UsersController < ApplicationController
  def new

  end

  def create
    if params[:password] == params[:password_confirmation]
      user = User.new params[:user]
      user.password = params[:password]
      if user.save
        session[:user_id] = user.id
        redirect_to root_path
      else
        flash.alert = user.errors.full_messages.join(' : ')
        render 'index'
      end
    else
      flash.alert = "Passwords must match!"
      render 'index'
    end
  end

end