class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :logged_in?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end


  def log_in(user)
    session[:user_id] = user.id
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session[:user_id] = nil
  end
end
