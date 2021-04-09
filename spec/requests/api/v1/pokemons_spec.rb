require 'rails_helper'


RSpec.describe 'Pokemons', type: :request do
    let(:json) {JSON.parse(response.body)}

    let(:user) {User.create(email: 'user_1@gmail.com', password: '12345678', password_confirmation: '12345678')}

    let(:pokemon) { Pokemon.create( number: 100, name: 'poke_one_name', type_1:'new',  total: 76,
        hp: 33, attack: 12, defense: 33, sp_atk: 15, sp_def: 20, speed: 19, generation:1, legendary: true, user_id: user.id ) }

    describe "GET /api/v1/pokemons" do
        it "returns http success" do
            get('/api/v1/pokemons')
            expect(json['status']).to eq('SUCCESS')
            expect(response).to have_http_status(:success)
            data = JSON.parse(response.body)
            expect(data).to be_an Hash
        end
        
        it "returns http success the paginated list" do
            get "/api/v1/pokemons"
            expect(response).to have_http_status(:success)
            data = JSON.parse(response.body)
            expect(data).to be_an Hash
        end
        
        it "returns http success the search list" do
            get "/api/v1/pokemons"
            expect(response).to have_http_status(:success)
            data = JSON.parse(response.body)
            expect(data).to be_an Hash
        end
    end
        
    describe "GET /api/v1/pokemons/id" do
        it "returns http success" do
            get "/api/v1/pokemons/#{pokemon.id}"
            expect(response).to have_http_status(:success)
            data = JSON.parse(response.body)
            expect(data).to be_a Hash
        end
    end
          
    describe 'POST /api/v1/pokemons'  do 
        it 'succes status pokemons' do
            post '/api/v1/pokemons' , params: {
                'Content-Type': 'application/json',
                'X-User-Email': "#{user.email}",
                'X-User-Token': "#{user.authentication_token}",
                pokemon: {
                    number: 100, name: 'new_poke', type_1:'new',  total: 76,
                    hp: 33, attack: 12, defense: 33, sp_atk: 15, sp_def: 20,
                    speed: 19, generation:1, legendary: true } 
                }
            expect(response).to have_http_status(:success)
            data = JSON.parse(response.body)
            expect(data).to be_a Hash
        end
    end

    describe "PATCH /api/v1/pokemons/:id" do
        it "returns http success" do
            patch "/api/v1/pokemons/#{pokemon.id}", params: {
                'Content-Type': 'application/json',
                'X-User-Email': "#{user.email}",
                'X-User-Token': "#{user.authentication_token}",
                pokemon: { name: 'poke_new_name' }}
            expect(response).to have_http_status(:success)
            data = JSON.parse(response.body)
            expect(data).to be_a Hash
        end
    end

    describe "DELETE /api/v1/pokemons/:id" do
        it "returns http success " do
            delete "/api/v1/pokemons/#{pokemon.id}",params: {
                'Content-Type': 'application/json',
                'X-User-Email': "#{user.email}",
                'X-User-Token': "#{user.authentication_token}"}
            expect(response).to have_http_status(:success)
            data = JSON.parse(response.body)
            expect(data).not_to be_a Hash
        end
      end

end
