class Pokemon < ApplicationRecord
    belongs_to :generation
    has_many :pokemon_moves
    has_many :moves, through: :pokemon_moves


    validates :name, presence: true
    validates :base_experience, presence: true, numericality: { only_integer: true , greater_than_or_equal_to: 0, less_than_or_equal_to: 2000 }
    validates :height, presence: true, numericality: { only_integer: true , greater_than_or_equal_to: 0}
    validates :order, uniqueness: true, numericality: { only_integer: true , greater_than_or_equal_to: 0}
    validates :weight, presence: true, numericality: { only_integer: true , greater_than_or_equal_to: 0}
    #validates :generation_id, presence: true
end
