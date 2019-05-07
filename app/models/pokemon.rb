class Pokemon < ApplicationRecord
    has_many :pokemon_versions
    has_many :versions, through: :pokemon_versions
    has_many :pokemon_moves
    has_many :moves, through: :pokemon_moves
end
