class WhiteBoardChannel < ApplicationCable::Channel
  def subscribed
    stream_from "white_board"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def write(data)
    p "-------"
    p data
    p "-------"
    ActionCable.server.broadcast "white_board", data: data["data"], message: data["data"].gsub("\n", "<br />")
  end
end
