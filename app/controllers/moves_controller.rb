class MovesController < ApplicationController
  before_action :current_move, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticated
  def index
    @moves = Move.all
    @search = params["search"]
    if @search.present?
        @name = @search["name"]
        @moves = Move.where("name LIKE ?", "%#{@name}%")
    end
  end

  def show
    @generation = @move.generation
  end

  def new
    @move = Move.new
    @pokemons = Pokemon.all
    @generations = Generation.all
  end

  def create
    @move = Move.new(move_params)

    if @move.valid?
      @move.save
      redirect_to @move
    else
      flash[:error] = @move.errors.full_messages
      redirect_to new_move_path
    end
  end

  def edit
    @pokemons = Pokemon.all
    @generations = Generation.all
  end

  def update
    @move.update(move_params)
    redirect_to @move
  end

  def destroy
  end

  private

  def current_move
    @move = Move.find(params[:id])
  end

  def move_params
    params.require(:move).permit(
      :name,
      :accuracy,
      :effect_chance,
      :pp,
      :priority,
      :power,
      :search,
      :effect,
      :generation_id,
      :pokemon_ids => []
    )
  end
  
end
