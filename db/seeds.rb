require "rest-client"
require "json"

Pokemon.destroy_all
Move.destroy_all
Generation.destroy_all
PokemonMove.destroy_all

Question.destroy_all


response_string = RestClient.get("https://pokeapi.co/api/v2/")
response_hash = JSON.parse(response_string)


generation_response_string = RestClient.get("https://pokeapi.co/api/v2/generation")
generation_response_hash = JSON.parse(generation_response_string)
generation_arr = generation_response_hash["results"]

generation_arr.each do |generation|
  Generation.create(
    name: generation["name"]
  )
end

#Move Seed Data
move_response_string = RestClient.get("https://pokeapi.co/api/v2/move/?limit=10")
move_response_hash = JSON.parse(move_response_string)
move_arr = move_response_hash["results"]

move_arr.each do |move|
  move_info = RestClient.get(move["url"])
  move_info_hash = JSON.parse(move_info)

  Move.create(
    url: move["url"],
    name: move["name"],
    accuracy: move_info_hash["accuracy"],
    effect_chance: move_info_hash["effect_chance"],
    pp: move_info_hash["pp"],
    priority: move_info_hash["priority"],
    power: move_info_hash["power"],
    effect: move_info_hash["effect_entries"][0]["effect"],
    generation_id: Generation.all.sample.id
  )
end

#Pokemon Seed Data
pokemon_response_string = RestClient.get("https://pokeapi.co/api/v2/pokemon/?limit=10")
pokemon_response_hash = JSON.parse(pokemon_response_string)
pokemon_arr = pokemon_response_hash["results"]

pokemon_arr.each do |pokemon|
  pokemon_info = RestClient.get(pokemon["url"])
  pokemon_info_hash = JSON.parse(pokemon_info)

  # species_info = RestClient.get(pokemon["url"]["species"]["url"])
  # species_info_hash = Json.parse(species_info)

  pokemon = Pokemon.create(
              name: pokemon["name"],
              base_experience: pokemon_info_hash["base_experience"],
              height: pokemon_info_hash["height"],
              order: pokemon_info_hash["order"],
              weight: pokemon_info_hash["weight"],
              generation_id: Generation.all.sample.id
              # species: species_info_hash[""]
            )

  pokemon_info_hash["moves"].each do |move|
    
    temp_move = Move.all.find_by(url: move["move"]["url"])
    if temp_move
      PokemonMove.create(pokemon_id: pokemon.id, move_id: temp_move.id )
    end
  
  end

end

#Generation Seed Data



# 20.times do 
#   PokemonGeneration.create(pokemon_id: Pokemon.all.sample.id , generation_id: Generation.all.sample.id)
# end

# 20.times do 
#   GenerationMove.create(generation_id: Generation.all.sample.id , move_id: Move.all.sample.id)
# end

# #Quiz info
# move_questions = []
# move_questions = PokemonMove.all


# 5.times do 
#   move = move_questions.sample
#   move_questions.delete(move)
#   selected_move = Move.find(move.move_id)

#   correct_poke_move = PokemonMove.where(move_id: move.move_id)
#   correct_pokemon = Pokemon.find(correct_poke_move.sample.pokemon_id)

#   incorrect_poke_move = PokemonMove.where.not(move_id: move.move_id)
#   temp = []
#   incorrect_poke_move.each do |poke_move|
#     temp << Pokemon.find(poke_move.pokemon_id).name
#   end
#   incorrect_pokemons = temp.uniq
#   incorrect_pokemons.delete(correct_pokemon.name)

#   options = ["op1", "op2", "op3", "op4"]
#   correct_option = options.sample
#   options.delete(correct_option)
#   incorrect_op1 = options.sample
#   options.delete(incorrect_op1)
#   incorrect_op2 = options.sample
#   options.delete(incorrect_op2)
#   incorrect_op3 = options.sample 

#   incorrect_poke_1 = incorrect_pokemons.sample
#   incorrect_pokemons.delete(incorrect_poke_1)
#   incorrect_poke_2 = incorrect_pokemons.sample
#   incorrect_pokemons.delete(incorrect_poke_2)
#   incorrect_poke_3 = incorrect_pokemons.sample

#   Question.create(content: "What pokemon has #{selected_move.name}?", "#{correct_option}": correct_pokemon.name,"#{incorrect_op1}": incorrect_poke_1 ,"#{incorrect_op2}": incorrect_poke_2, "#{incorrect_op3}": incorrect_poke_3, correct_answer: correct_pokemon.name )
# end



