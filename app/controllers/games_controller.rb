class GameController < ApplicationController
  def create
    debugger
    # if @current_user
       @game=Game.create(
         dimensions:params['game']['dimensions'],
         winner: :not_yet_concluded,
         user1: User.find(params['game']['user1']),
         user2: User.find(params['game']['user2'])
       )
    # else
    #   render json:{
    #     :not_permitted =>"Not permitted without login"
    #   }
    # end
  end

  def fetch_game_id
    @game=Game.find_by(user2:params[:game][:user2])
  end
end
