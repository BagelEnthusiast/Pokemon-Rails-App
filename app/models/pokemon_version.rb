class PokemonVersion < ApplicationRecord
    belongs_to :pokemon
    belongs_to :version
end
