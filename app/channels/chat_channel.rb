class ChatChannel < ApplicationCable::Channel
  # channelの設定
  def subscribed
    stream_from "chat_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
