class Api::V1::PokemonsController < Api::V1::BaseController
    acts_as_token_authentication_handler_for User, except: [ :index, :show ]

    def index
        @pokemons = policy_scope(Pokemon)
        render json: @pokemons
    end

    def show
        @pokemon = Pokemon.find(params[:id])
        authorize @pokemon
        render json: @pokemon
    end
    
    def create
        @pokemon = Pokemon.new(pokemon_params)
        @pokemon.user = current_user
        authorize @pokemon
        if @pokemon.save
            render json: @pokemon
        else
            render json: {status: 'FAILED', message: 'Pokemon not created', data: '', error: 'not created'}, status: :bad_request
        end
    end
    
    def update
        @pokemon = Pokemon.find(params[:id])
        authorize @pokemon
        if @pokemon.update(pokemon_params)
            render json: @pokemon
        else
            render json: {status: 'FAILED', message: 'Pokemon not updated', data: '', error: 'not updated'}, status: :bad_request
        end
    end


    private

    def pokemon_params
        params.require(:pokemon).permit(:number, :name, :type_1, :type_2, :total,
            :hp, :attack, :defense, :sp_atk, :sp_def, :speed, :generation, :legendary)
    end
end