class RewardsController < ApplicationController
  def index
    if current_user
      authorize! :read, @current_user
      @rewards = Reward.all
    else
      flash[:error] = "You must sign in to see this information."
      redirect_to root_url
    end
  end
end
