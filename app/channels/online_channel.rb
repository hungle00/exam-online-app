class OnlineChannel < ApplicationCable::Channel
  def subscribed
    stream_from "online_channel"
  end

  def unsubscribed
    ActionCable.server.broadcast "online_channel", user_id: current_user.id, status: 'offline'
  end

  def appear
    ActionCable.server.broadcast "online_channel", user_id: current_user.id, status: 'online'
  end
end
