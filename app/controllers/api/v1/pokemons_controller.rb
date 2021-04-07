class Api::V1::PokemonsController < Api::V1::BaseController

    def index
        @pokemons = policy_scope(Pokemon)
        render json: @pokemons
    end

    def show
        @pokemon = Pokemon.find(params[:id])
        authorize @pokemon
        render json: @pokemon
    end

    
end