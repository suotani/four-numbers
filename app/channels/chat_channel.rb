class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_channel_#{params[:room_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Chat.create(message: data["message"], room_id: data["room_id"])
    #ActionCable.server.broadcast "chat_channel", message: "aaa"
  end

  #def check
  #  p "----check!-----"
  #end
end
