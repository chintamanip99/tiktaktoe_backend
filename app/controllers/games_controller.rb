class GamesController < ApplicationController
  def create
       fetch_game
       unless @game
         @game = Game.create(
           dimensions: params['dimensions'],
           user1: current_user,
           user2: User.find_by_email(params['email_user2'])
         )
       end
  end

  def fetch_game
    @game = Game.where("user1_id or user2_id", current_user.id, current_user.id).where(winner: 0).last
  end

  def fetch_games
    @games = Game.where("user1_id or user2_id", current_user.id, current_user.id)
  end
end
