require "rest-client"
require "json"

Pokemon.destroy_all
Move.destroy_all

response_string = RestClient.get("https://pokeapi.co/api/v2/")
response_hash = JSON.parse(response_string)

#Pokemon Seed Data
pokemon_response_string = RestClient.get("https://pokeapi.co/api/v2/pokemon/?limit=10")
pokemon_response_hash = JSON.parse(pokemon_response_string)
pokemon_arr = pokemon_response_hash["results"]

pokemon_arr.each do |pokemon|
    pokemon_info = RestClient.get(pokemon["url"])
    pokemon_info_hash = JSON.parse(pokemon_info)

  Pokemon.create(
    name: pokemon["name"],
    base_experience: pokemon_info_hash["base_experience"],
    height: pokemon_info_hash["height"],
    order: pokemon_info_hash["order"],
    weight: pokemon_info_hash["weight"]
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
    name: move["name"],
    accuracy: move_info_hash["accuracy"],
    effect_chance: move_info_hash["effect_chance"],
    pp: move_info_hash["pp"],
    priority: move_info_hash["priority"],
    power: move_info_hash["power"],
    effect: move_info_hash["effect_entries"][0]["effect"]
  )
end
