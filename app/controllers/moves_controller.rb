class MovesController < ApplicationController

  def create
    @move = Move.create(
      game_id: params['game_id'],
      the_move: params['move_name'],
      move_column: params['move_column'],
      move_row: params['move_row']
    )
    ActionCable.server.broadcast("move_#{params[:game_id]}", @move)
    render json: @move
  end

  def fetch_moves
    @moves = Move.where('moves.game_id = ?',params[:game_id])
    # @moves = Move.joins(:game).where('games.user1_id = ? or games.user2_id = ?',current_user.id, current_user.id).where('moves.game_id = ?',params[:game_id])
  end
end
