require_relative '../lib/pokemon_importer'


puts 'creating users...'
user_1 = User.create!(email: 'user_1@gmail.com', password: 123456)
user_2 = User.create!(email: 'user_2@gmail.com', password: 123456)
user_3 = User.create!(email: 'user_3@gmail.com', password: 123456)
puts 'created users'


puts 'creating pokemons'
unless Pokemon.any?
    data = File.join(Rails.root, 'db/data/pokemon.csv')
    poke_importer = PokemonImporter.new(data)
    poke_importer.fetch
end
puts 'created pokemons'