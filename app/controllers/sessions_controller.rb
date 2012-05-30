class SessionsController < ApplicationController
  def new
  end

  def create
   user = User.from_omniauth(env["omniauth.auth"],params)
   session[:user_id] = user.id
   session["return_to"] = params[:return_to] if params[:return_to].present?
   if session["return_to"].present?
    return_page = session["return_to"]
    session["return_to"] = nil
    redirect_to return_page
   else
    redirect_to root_url, notice: "Signed in!"
   end
  end

  def destroy
   session[:user_id] = nil
   redirect_to root_url, notice: "Signed out!"
  end

  def failure
   session["return_to"] = request.referer unless session[:return_to].present?
   redirect_to login_path, alert: "Authentication failed, please try again."
  end
end
