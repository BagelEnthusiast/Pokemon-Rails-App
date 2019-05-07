class CreateVersionMoves < ActiveRecord::Migration[5.2]
  def change
    create_table :version_moves do |t|
      t.integer :move_id
      t.integer :version_id

      t.timestamps
    end
  end
end
