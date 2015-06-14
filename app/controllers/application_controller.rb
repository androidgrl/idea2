class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :signed_in?, :current_user

  def current_user
    if signed_in?
      @current_user ||= User.find(session[:user_id])
    end
  end

  def signed_in?
    session.key?(:user_id)
  end

  def current_admin?
    current_user && current_user.admin?
  end
end
