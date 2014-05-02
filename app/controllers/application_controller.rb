class ApplicationController < ActionController::Base
  protect_from_forgery

  
  helper_method :fetch_name
  include Authentication
  helper_method :current_user


    

end
