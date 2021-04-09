require_relative '../lib/pokemon_importer'

# Create 3 user for seed
puts 'creating users...'
user_1 = User.create!(email: 'user_1@gmail.com', password: 123456)
user_2 = User.create!(email: 'user_2@gmail.com', password: 123456)
user_3 = User.create!(email: 'user_3@gmail.com', password: 123456)
puts 'created users'

# Import data from pokemon.csv file in path db/data/pokemon.csv
puts 'creating pokemons'
unless Pokemon.any?
    data = File.join(Rails.root, 'db/data/pokemon.csv')
    poke_importer = PokemonImporter.new(data) # lib/pokemon_importer.rb
    poke_importer.fetch
end
puts 'created pokemons'