class MovesController < ApplicationController

  def create
    @move = Move.create(
      game_id: params['game_id'],
      the_move: params['move_name'],
      move_column: params['move_column'],
      move_row: params['move_row']
    )
    if(Move.where(game_id: params['game_id'], the_move: params['move_name']).count >= Game.find(@move.game_id).dimensions)
      service = WinnerCalculatorService.new(@move.game_id, @move.the_move)
      won = service.check_if_winner
    end
    hash = {}
    if(won)
      hash[:winner]=current_user.email
    end
    hash[:move] = @move
    ActionCable.server.broadcast("move_#{params[:game_id]}", hash)
    Game.find(@move.game_id).set_winner(current_user)
    render json: @move
  end

  def fetch_moves
    @moves = Move.where('moves.game_id = ?',params[:game_id])
    # @moves = Move.joins(:game).where('games.user1_id = ? or games.user2_id = ?',current_user.id, current_user.id).where('moves.game_id = ?',params[:game_id])
  end
end
