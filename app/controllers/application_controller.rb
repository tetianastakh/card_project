class ApplicationController < ActionController::Base
  include SessionsHelper
  protect_from_forgery with: :exception

  def logged_in_user
    unless logged_in?
      redirect_to login_url
    end
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
