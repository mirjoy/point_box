class Reward < ActiveRecord::Base
  validates :name, presence: true
  validates :point_value, presence: true
  validates_numericality_of :point_value, on: :create

  has_many :user_rewards
  has_many :users, through: :user_rewards
end
