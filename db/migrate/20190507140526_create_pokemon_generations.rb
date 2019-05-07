class CreatePokemonGenerations < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemon_generations do |t|
      t.integer :pokemon_id
      t.integer :generation_id
      
      t.timestamps
    end
  end
end
