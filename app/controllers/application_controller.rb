class ApplicationController < ActionController::Base
  protect_from_forgery

  include Authentication
  helper_method :current_user
  helper_method :fetch_name
end
