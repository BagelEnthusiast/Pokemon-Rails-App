class PokemonsController < ApplicationController
    def index
        @pokemons = Pokemon.all
        @search = params["search"]
        if @search.present?
            @name = @search["name"]
            @pokemons = Pokemon.where("name LIKE ?", "%#{@name}%")
        end
    end

    private
    def pokemon_params
        params.require(:pokemon).permit(:name, :base_experience, :order, :height, :weight, :search)
    end

end
