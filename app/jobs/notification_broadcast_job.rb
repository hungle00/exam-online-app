class NotificationBroadcastJob < ApplicationJob
  queue_as :default

  def perform(notification)
    # Do something later
    notification_count = Notification.for_user(notification.user_id)
    ActionCable.server.broadcast "notifications.#{ notification.user_id }", { message: notification_count }
  end
end
