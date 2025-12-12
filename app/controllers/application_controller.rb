class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id].present?
  end

  def logged_in?
    !!current_user
  end

  def require_user
    return if logged_in?

    flash[:error] = 'You need to login!'
    redirect_to login_path
  end

  # Check user is admin
  def user_admin?
    logged_in? && current_user.admin?
  end
end
