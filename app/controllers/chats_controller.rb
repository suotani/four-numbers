class ChatsController < ApplicationController

  def index
    @rooms = Room.all
  end

  def show
    @room_id = params[:id]
    @chats = Chat.where(room_id: params[:id])
  end
end