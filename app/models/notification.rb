class Notification < ApplicationRecord
  belongs_to :user

  after_create { NotificationBroadcastJob.perform_now(self) }

  scope :leatest, ->{order("created_at DESC")}
  scope :unviewed, ->{where(viewed: false)}

  def self.for_user(user_id)
    Notification.where(user_id: user_id).unviewed.count
  end
end
