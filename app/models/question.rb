class Question < ApplicationRecord
  # has_many :responses
  # has_many :answers
  # belongs_to :correct_answer, class_name: "Answer", optional: true

  # def random_answers
  #     self.answers.order("RANDOM()")
  # end
    @@move = nil
    @@correct_poke = nil

  def new_move
    move = PokemonMove.all.sample
    # move_questions.delete(move)
    @@move = Move.find(move.move_id)
  end

  def correct_pokemon
    correct_poke_move = PokemonMove.where(move_id: @@move.id)
    @@correct_poke = Pokemon.find(correct_poke_move.sample.pokemon_id)
  end

  def incorrect_options
    
    incorrect_poke_moves = PokemonMove.where.not(move_id: @@move.id)
    temp = []
    pokemon_with_move = []
    @@move.pokemons.each do |poke|
      pokemon_with_move << poke.name
    end
    incorrect_poke_moves.each do |poke_move|
      temp << Pokemon.find(poke_move.pokemon_id).name
    end
    incorrect_pokemons = temp.uniq
    incorrect_pokemons.delete(@@correct_poke.name)
    incorrect_pokemons-pokemon_with_move
    
  end

  def set_options
    
    options = ["op1", "op2", "op3", "op4"]
    correct_option = options.sample
    options.delete(correct_option)
    incorrect_op1 = options.sample
    options.delete(incorrect_op1)
    incorrect_op2 = options.sample
    options.delete(incorrect_op2)
    incorrect_op3 = options.sample 

    incorrect_pokemons = incorrect_options
  
    incorrect_poke_1 = incorrect_pokemons.sample
    incorrect_pokemons.delete(incorrect_poke_1)
    incorrect_poke_2 = incorrect_pokemons.sample
    incorrect_pokemons.delete(incorrect_poke_2)
    incorrect_poke_3 = incorrect_pokemons.sample

    question_ans = {
        "#{correct_option}": @@correct_poke.name,
        "#{incorrect_op1}": incorrect_poke_1,
        "#{incorrect_op2}": incorrect_poke_2,
        "#{incorrect_op3}": incorrect_poke_3}
    byebug
  end

end
