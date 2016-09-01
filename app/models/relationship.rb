class Relationship < ActiveRecord::Base
  belongs_to :follower, class_name: User.name
  belongs_to :followed, class_name: User.name
  after_create :create_activity_follow
  after_destroy :create_activity_unfollow

  private

  def create_activity_follow
    Activity.create user_id: follower_id, target_id: id, action_type: :follow
  end

  def create_activity_unfollow
    Activity.create user_id: follower_id, target_id: id, action_type: :unfollow
  end
end
