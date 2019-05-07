class CreateMoves < ActiveRecord::Migration[5.2]
  def change
    create_table :moves do |t|
      t.string :name
      t.integer :accuracy
      t.integer :effect_chance
      t.integer :pp
      t.integer :priority
      t.integer :power
      t.string :effect

      t.timestamps
    end
  end
end
