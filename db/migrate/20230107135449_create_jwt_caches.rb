class CreateJwtCaches < ActiveRecord::Migration[7.0]
  def change
    create_table :jwt_caches do |t|
      t.string :token

      t.timestamps
    end
  end
end
