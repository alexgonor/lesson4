class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # debugger
  end
  helper_method :current_user

  def authorize
    current_user ? (redirect_to '/tasks') : (redirect_to '/login')
  end

end
