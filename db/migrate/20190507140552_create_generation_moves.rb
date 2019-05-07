class CreateGenerationMoves < ActiveRecord::Migration[5.2]
  def change
    create_table :generation_moves do |t|
      t.integer :move_id
      t.integer :generation_id

      t.timestamps
    end
  end
end
