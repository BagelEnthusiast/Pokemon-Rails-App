class Move < ApplicationRecord
    belongs_to :generation
    has_many :pokemon_moves
    has_many :pokemons, through: :pokemon_moves

    validates :name, presence: true
    validates :accuracy, presence: true, numericality: { only_integer: true , greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
    # validates :effect_chance, presence: true, numericality: { only_integer: true , greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
    validates :pp, presence: true, numericality: { only_integer: true , greater_than_or_equal_to: 0}
    validates :priority, presence: true, numericality: { only_integer: true , greater_than_or_equal_to: 0}
    validates :power, presence: true, numericality: { only_integer: true , greater_than_or_equal_to: 0}
    validates :effect, presence: true
    
end
