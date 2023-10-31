class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.integer :dimensions
      t.integer :winner, default: 0
      t.bigint :user1_id
      t.bigint :user2_id
      t.timestamps
    end
    add_foreign_key :games, :users, column: "user1_id"
    add_foreign_key :games, :users, column: "user2_id"
  end
end
