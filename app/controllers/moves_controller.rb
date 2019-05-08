class MovesController < ApplicationController
    def index
        @moves = Move.all
        @search = params["search"]
        if @search.present?
            @name = @search["name"]
            @moves = Move.where("name LIKE ?", "%#{@name}%")
        end
    end

    private
    def move_params
        params.require(:move).permit(:url, :name, :accuracy, :effect_chance, :pp, :priority, :power, :effect, :search)
    end
end
