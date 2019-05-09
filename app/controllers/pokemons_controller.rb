class PokemonsController < ApplicationController
  before_action :current_pokemon, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticated
  def index
    @pokemons = Pokemon.all
    @search = params["search"]
    if @search.present?
        @name = @search["name"]
        @pokemons = Pokemon.where("name LIKE ?", "%#{@name}%")
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
    params.require(:pokemon).permit(
      :name,
      :base_experience,
      :height,
      :order,
      :search,
      :weight,
      :generation_id,
      :move_ids => [],
    )
  end
 
end
