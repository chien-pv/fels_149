class Activity < ActiveRecord::Base
  belongs_to :user
  enum action_type: [:follow, :unfollow, :learned]

end
