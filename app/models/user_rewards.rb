class UserRewards < ActiveRecord::Base
  belongs_to :users
  belongs_to :rewards
end
