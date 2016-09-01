class Activity < ActiveRecord::Base
  belongs_to :user
  enum action_type: [:follow, :unfollow, :learned]

  scope :by_date, -> {order(created_at: :desc)}

  def load
    case action_type
    when "follow"
      user_followed = User.find_by id: target_id
      return "#{user.name} #{I18n.t "user.activity.follow"}
        #{user_followed.try(:name)} -
        (#{created_at.strftime(I18n.t "time.formats.myformat")})"
    when "unfollow"
      user_follower = User.find_by id: target_id
      return "#{user.name} #{I18n.t "user.activity.unfollow"}
        #{user_follower.name} -
        ((#{created_at.strftime(I18n.t "time.formats.myformat")})"
    when "learned"
      lesson = user.lessons.find_by id: target_id
      return "#{action_type} #{lesson.results.count}
        #{I18n.t "user.activity.learned"}
        #{lesson.category.name} -
        ((#{created_at.strftime(I18n.t "time.formats.myformat")})"
    end
  end
end
