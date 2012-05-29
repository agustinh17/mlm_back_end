class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :login_required

  private

  def current_user
   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def login_required
   if current_user
    return true
   end
   session[:return_to]=request.env["REQUEST_URI"]
   redirect_to login_path, alert: "Please login to continue."
   return false
  end
end
