class Move < ApplicationRecord
  belongs_to :game
  enum the_move: { O: 0, X: 1}
  after_create :check_if_game_concluded

  def check_if_game_concluded
    game.update(winner: 1) if game.moves.length == 9
  end
  # validate :validate_creation

  # private

  # def validate_creation
  #
  # end

end
