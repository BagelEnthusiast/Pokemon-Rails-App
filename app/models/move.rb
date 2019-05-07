class Move < ApplicationRecord
    has_many :pokemon_moves
    has_many :pokemons, through: :pokemon_moves
    has_many :version_moves
    has_many :versions, through: :version_moves
end
