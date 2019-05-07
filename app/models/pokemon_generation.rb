class PokemonGeneration < ApplicationRecord
    belongs_to :pokemon
    belongs_to :generation
end
