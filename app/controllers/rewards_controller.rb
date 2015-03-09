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

  def new
  end

  def create
    reward = Reward.new(name: params[:reward][:name], point_value: params[:reward][:point_value])
    if reward.save
      redirect_to rewards_path
    else
      flash[:error] = "Please fill in all of the fields. Make sure your point value is a number"
      render :new
    end
  end

  def update
    user = User.find(params[:id])
    reward = Reward.find_by(id: params[:admin][:reward])
    if reward.point_value > user.available_points
      flash[:cheap] = "You don't have enough points to claim that reward."
    else
      user.available_points -= reward.point_value
      user.redeemed_points += reward.point_value
      user.rewards << reward
      user.save
    end
    redirect_to rewards_path
  end

  def edit

  end

  def destroy
    reward = Reward.find(params[:id])
    reward.destroy
    redirect_to rewards_path
  end
end
