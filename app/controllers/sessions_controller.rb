class SessionsController < ApplicationController
  def index
    if current_user
      authorize! :read, @current_user
      @points = current_user.points
    else
      flash[:error] = "You must sign in to see this information."
      redirect_to root_url
    end
  end

  def new
  end

  def create
    user = User.find_by(name: params[:session][:user_name])

    if user && user.authenticate(params[:session][:password])
      log_in(user)
      flash[:welcome] = "Welcome"
      redirect_to dashboard_path
    else
      flash[:error] = "Invalid username/password combo. Try again"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end



end
