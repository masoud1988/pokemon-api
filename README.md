# Pokemones API - PetalMD

This is an API Project in which the data consists of 800 Pokemon on the CSV file
imported to the projects as seed. this API include CRUD actions, Search, Pagination,
and Rspec for TDD. Best practices are used throughout the project to make the codes
easy to read and keep maintainability during the project.

The final project has been deployed on HEROKU which is accessible with this URL
https://petalmd-api.herokuapp.com/api/v1/pokemons
and it could be tested with the POSTMAN.

n this project, devise and pundit have been used for authorization and authentication,
respectively. Besides, a Simple token authentication gem has been employed to send a
specific token related to user as a parameter.

## CRUD functions

Displaying all the Pokemons or a specific Pokemon is public. But, for create, edit,
and delete a Pokemon, sign in as a user.

That’s why it should be use these headers:

- Usage headers

        'Content-Type' : 'application/json'
        'X-User-Email' : 'user_1@gmail.com'
        'X-User-Token' : 'E2bpCJ9Rg5c1Stemxgzo'

        'Content-Type' : 'application/json'
        'X-User-Email' : 'user_2@gmail.com'
        'X-User-Token' : 'GLTuWqzzH7tmdhPsEcRS'

        'Content-Type' : 'application/json'
        'X-User-Email' : 'user_3@gmail.com'
        'X-User-Token' : 'zEfyNEb-payr-rAsfxZm'

- Read

        GET # List all pokemons
            https://petalmd-api.herokuapp.com/api/v1/pokemons

        GET # Show a specific pokemon
            https://petalmd-api.herokuapp.com/api/v1/pokemons/1

- Create

        POST # Create a new pokemon
            https://petalmd-api.herokuapp.com/api/v1/pokemons

        to create a pokemon set *usage headers* and put json object in the *Body* of the request
       {
            "number": 1,
            "name": "Lumbanaur",
            "type_1": "Grass",
            "type_2": "Poison",
            "total": 317,
            "hp": 34,
            "attack": 39,
            "defense": 59,
            "sp_atk": 75,
            "sp_def": 55,
            "speed": 65,
            "generation": 1,
            "legendary": true
       }

- Update

        PUT # Update a specific pokemon
            https://petalmd-api.herokuapp.com/api/v1/pokemons/:id

        to update a pokemon  set *usage headers* and put json object in the *Body* of the request

- Delete

        DELETE # Delete a specific pokemon
            https://petalmd-api.herokuapp.com/api/v1/pokemons/:id

        to update a pokemon  set *usage headers* and put json object in the *Body* of the request

## SEARCH

In this project, PG Search has been used for searching. Powerful searchability and easy-to-read are
the most practical characteristics of PGS instead of ActiveRecord search.

Elasticsearch is another great option to search, however, there was some limitation about deploying
the project on Heroku, which’s why PGS has been chosen.

Data could be searched based on names, type_1, and type_2.
To pass a query (?q=(name , type_1, type_2)) to the URL to search a pokemon from the list as demonstrated:

If pokemon with id=8 has a name like "CharizardMega Charizard Y" it could be find :

https://petalmd-api.herokuapp.com/api/v1/pokemons?q=CharizardMega Charizard Y
https://petalmd-api.herokuapp.com/api/v1/pokemons?q=Charizard
https://petalmd-api.herokuapp.com/api/v1/pokemons?q=chari
https://petalmd-api.herokuapp.com/api/v1/pokemons?q=Y

## PAGINATION

Kaminari gem is used for pagination. It has been created for frontend developers to have
easy access and easy navigation within the pages. Pagination includes the total count of
pokemon, first and last page, previous and next page.
Pages and pair pages could pass to the URL as a parameter to get the pagination.
There are 10 pokemon on every page by default.

        https://petalmd-api.herokuapp.com/api/v1/pokemons
        By default  every page 10 pokemons ... starting from id = 1

        However, it is possible to change the page and per_page of the pagination,
        directly on the endpoint address. for example:

        http://localhost:3000/api/v1/pokemons?page=5&per_page=50
        every page 50 pokemons .... starting from id = 201

On postmen software, the links of pagination are displayed on headers, for instance:
If choose page 10:
http://localhost:3000/api/v1/pokemons?page=10

        links:

        <https://petalmd-api.herokuapp.com/api/v1/pokemons{"page"=>1}>; rel='first',
        <https://petalmd-api.herokuapp.com/api/v1/pokemons{"page"=>9}>; rel='prev',
        <https://petalmd-api.herokuapp.com/api/v1/pokemons{"page"=>11}>; rel='next',
        <https://petalmd-api.herokuapp.com/api/v1/pokemons{"page"=>80}>; rel='last'

## TEST

Rspect is used for testing the project which should run the test need to clone the code
from GitHub repositiory and run it on your local machine.

here is the test file:
./spec/models/pokemons_spec.rb
./spec/requests/api/v1/pokemons_spec.rb

to execute the test:

        bundle exec rspec ./spec/models/pokemons_spec.rb --format documentation
