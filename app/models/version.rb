class Version < ApplicationRecord
    has_many :pokemon_versions
    has_many :pokemons, through: :pokemon_versions
    has_many :version_moves
    has_many :moves, through: :version_moves
end
