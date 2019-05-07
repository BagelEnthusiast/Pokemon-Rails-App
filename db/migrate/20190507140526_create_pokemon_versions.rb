class CreatePokemonVersions < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemon_versions do |t|
      t.integer :pokemon_id
      t.integer :version_id
      
      t.timestamps
    end
  end
end
