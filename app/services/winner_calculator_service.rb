class WinnerCalculatorService

  attr_accessor :game,:rows,:columns,:dimensions
  def initialize(game_id,  move_name)
    @game = Game.find(game_id)
    @rows = game.moves.where(the_move: move_name).pluck(:move_row)
    @columns = game.moves.where(the_move: move_name).pluck(:move_column)
    @dimensions = game.dimensions
  end

  def check_if_winner
    debugger
    check_win_for_non_diagonals || check_win_for_diag1 || check_win_for_diag2
  end

  private

  def check_win_for_non_diagonals
    row_hash = Hash.new(0)
    rows.each { |element| row_hash[element] += 1 }
    column_hash = Hash.new(0)
    columns.each { |element| column_hash[element] += 1 }
    row_hash.values.max >= dimensions || column_hash.values.max >= dimensions
  end

  def check_win_for_diag1
    row_equals_col_count = 0
    (0...(dimensions-1)).each do |i|
      row_equals_col_count += 1 if rows[i] == columns[i]
    end
    row_equals_col_count >= dimensions
  end

  def check_win_for_diag2
    row_equals_col_count = 0
    columns1 = columns.reverse
    (0...(dimensions-1)).each do |i|
      row_equals_col_count += 1 if rows[i] == columns1[i]
    end
    row_equals_col_count >= dimensions
  end
end