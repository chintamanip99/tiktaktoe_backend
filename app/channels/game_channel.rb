class GameChannel < ApplicationCable::Channel

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def subscribed
    stream_from "game_user#{params[:user_id]}"
  end

end
