class Api::V1::PokemonsController < Api::V1::BaseController

    acts_as_token_authentication_handler_for User, except: [ :index, :show ]
    before_action :set_pokemon, only: [ :show, :update, :destroy]

    # GET /api/v1/pokemons - unauthenticated
    def index
        if params[:q].present?
            @pokemons = policy_scope(Pokemon.search_by_name(params[:q]))
            render json: {status: 'SUCCESS', message: 'Pokemon was searched', data: @pokemons}, status: :ok
        else
            @pokemons = policy_scope(Pokemon.page(page).per(per_page))
            set_pagination_headers(@pokemons)
            render json: {status: 'SUCCESS', message: 'Pokemon loaded (paginated)', data: @pokemons}, status: :ok
        end
    end

    # GET /api/v1/pokemons/:id - unauthenticated
    def show
        render json: {status: 'SUCCESS', message: 'Pokemon loaded', data: @pokemon}, status: :ok
    end
    
    # POST /api/v1/pokemons - authenticated
    def create
        @pokemon = Pokemon.new(pokemon_params)
        @pokemon.user = current_user
        authorize @pokemon
        if @pokemon.save
            render json: {status: 'SUCCESS', message: 'Pokemon created', data: @pokemon}, status: :ok
        else
            render json: {status: 'FAILED', message: 'Pokemon not created', data: 'not created', error: error}, status: :unprocessable_entity
        end
    end
    
    # PATCH /api/v1/pokemons/:id - authenticated
    def update
        if @pokemon.update(pokemon_params)
            render json: {status: 'SUCCESS', message: 'Pokemon updated', data: @pokemon}, status: :ok
        else
            render json: {status: 'FAILED', message: 'Pokemon not updated', data: '', error:  error}, status: :unprocessable_entity
        end
    end

    # DELETE /api/v1/pokemons/:id - authenticated
    def destroy
        @pokemon.destroy
        render json: {status: 'SUCCESS', message: 'Pokemon deleted', data: ''}, status: :ok
    end
    
    private
    
    def pokemon_params
        params.require(:pokemon).permit(:number, :name, :type_1, :type_2, :total,
        :hp, :attack, :defense, :sp_atk, :sp_def, :speed, :generation, :legendary)
    end
    
    def set_pokemon
        @pokemon = Pokemon.find(params[:id])
        authorize @pokemon
    end

    def error
        @pokemon.errors.full_messages 
    end

    def page
        @page ||= params[:page] || 1
    end

    def per_page
        @per_page ||= params[:per_page] || 10
    end

    def set_pagination_headers(pokemon_collector)

        headers["X-Total-Count"] = pokemon_collector.total_count

        links = []
        links << page_link(1, "first") unless pokemon_collector.first_page?
        links << page_link(pokemon_collector.prev_page, "prev") if pokemon_collector.prev_page
        links << page_link(pokemon_collector.next_page, "next") if pokemon_collector.next_page
        links << page_link(pokemon_collector.total_pages, "last") unless pokemon_collector.last_page?

        headers["Link"] = links.join(", ") if links.present?
    end

    def page_link(page, rel)
        main_url = request.url.split("?").first
        "<#{main_url}#{ request.query_parameters.merge(page: page) }>; rel='#{rel}'"
    end

end