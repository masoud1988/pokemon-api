require 'csv'

class PokemonImporter

    attr_reader :file

    def initialize(file)
        @file = file
    end

    def fetch 
        pokemons = []

        CSV.foreach(file, csv_option) do |row|
            pokemons << {
                number: row['#'],
                name: row['Name'],
                type_1: row['Type 1'],
                type_2: row['Type 2'],
                total: row['Total'],
                hp: row['HP'],
                attack: row['Attack'],
                defense: row['Defense'],
                sp_atk: row['Sp. Atk'],
                sp_def: row['Sp. Def'],
                speed: row['Speed'],
                generation: row['Generation'],
                legendary: row['Legendary'],
                user_id: rand(1..3)
            }
        end
        Pokemon.create!(pokemons)
    end

    private

    def csv_option
        {headers: :first_row}
    end

end