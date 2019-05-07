class Move < ApplicationRecord
    has_many :pokemon_moves
    has_many :pokemons, through: :pokemon_moves
    has_many :generation_moves
    has_many :generations, through: :generation_moves
end
