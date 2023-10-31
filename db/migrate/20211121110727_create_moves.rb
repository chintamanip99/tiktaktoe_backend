class CreateMoves < ActiveRecord::Migration[6.1]
  def change
    create_table :moves do |t|
      t.references :game, null: false, foreign_key: true
      t.integer :the_move
      t.integer :move_column
      t.integer :move_row

      t.timestamps
    end
  end
end
