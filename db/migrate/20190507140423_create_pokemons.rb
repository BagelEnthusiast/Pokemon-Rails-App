class CreatePokemons < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :base_experience
      t.integer :height
      t.integer :order
      t.integer :weight
      t.integer :generation_id
      # t.string :species

      t.timestamps
    end
  end
end
