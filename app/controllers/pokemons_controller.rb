class PokemonsController < ApplicationController
  before_action :current_pokemon, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticated
  def index
    
    @pokemons = Pokemon.all
    @moves = Move.all
    

    @search = params["search"]
    if @search.present?
        @name = @search["name"]
        @move = @search["move"]
        
        if @name != ""
          @pokemons = Pokemon.where("name LIKE ?", "%#{@name}%")
        else

          @move_object = Move.find_by(name: @move)
          @pokemon_moves = PokemonMove.where(move_id: @move_object.id)
          # @pokemon_moves = PokemonMove.where("move_id LIKE ?", "%#{@move_object.ids.join.to_i}%")
          #now we have all the moves with the 
          #@pokemon_moves.where(move_id: @moves.id)
          @pokemons = @pokemon_moves.map do |pokemon_move|
            pokemon_move.pokemon
          end

          # @pokemon_ids = @pokemon_moves.ids
          # @pokemons = []
          # @pokemon_ids.each do |id|
          #   @pokemons << Pokemon.where("id LIKE ?", "%#{id}%")
          # end
          
          # @pokemons
          
    
        end
    end
  end

  def show
    @generation = @pokemon.generation
  end

  def new
    @pokemon = Pokemon.new
    @moves = Move.all
    @generations = Generation.all
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)

    if @pokemon.valid?
      @pokemon.save

      redirect_to @pokemon
    else
      flash[:error] = @pokemon.errors.full_messages
      redirect_to new_pokemon_path
    end
  end

  def edit
    @moves = Move.all
    @generations = Generation.all
  end

  def update
    @pokemon.update(pokemon_params)
    redirect_to @pokemon
  end

  def destroy
  end

  private

  def current_pokemon
    @pokemon = Pokemon.find(params[:id])
  end

  def pokemon_params
    byebug
    params.require(:pokemon).permit(
      :name,
      :base_experience,
      :height,
      :order,
      :search,
      :weight,
      :term,
      :generation_id,
      :move_ids => [],
    )
  end
 
end
