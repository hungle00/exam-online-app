class NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications.order(created_at: :desc).limit(6)

    respond_to do |format|
      format.html
      format.js
    end
  end
end
