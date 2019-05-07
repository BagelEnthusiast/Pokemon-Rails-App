class Generation < ApplicationRecord
    has_many :pokemon_generations
    has_many :pokemons, through: :pokemon_generations
    has_many :generation_moves
    has_many :moves, through: :generation_moves
end
