module Authentication
  def current_user
    @user ||= User.find session[:user_id] if session[:user_id]
  end

  def authenticate!
    redirect_to root_path unless current_user.present?
  end

  def login(user)
    session[:user_id] = user.id
  end

  def is_admin?
    current_user.email == "admin@admin.com"
  end

  def logged_in?
    current_user.present?
  end
end