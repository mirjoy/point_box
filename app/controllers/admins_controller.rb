class AdminsController < ApplicationController
  def index
    if current_user.admin?
      authorize! :manage, @current_user
      @users = User.all
    else
      flash[:error] = "You are not authorized to see this page."
      redirect_to root_url
    end
  end
end
