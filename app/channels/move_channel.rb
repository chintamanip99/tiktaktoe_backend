class MoveChannel < ApplicationCable::Channel



  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def subscribed
    stream_from "move_#{params[:game_id]}"
  end

end
