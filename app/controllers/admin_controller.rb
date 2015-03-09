class AdminController < ApplicationController
  def index
    if current_user.admin?
      authorize! :manage, @current_user
      @users = User.all
    else
      flash[:error] = "You are not authorized to see this page."
      redirect_to root_url
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.available_points += (params[:admin][:available_points]).to_i
    user.redeemed_points += (params[:admin][:redeemed_points]).to_i
    user.save
    flash[:changed] = "Changes Made"
    redirect_to admin_path
  end
end
