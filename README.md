# Pokemone API - PetalMD

This is an **API Project** in which the data consists of 800 Pokemon on the **CSV** file
imported to the projects as seed. This API include **CRUD actions, Search, Pagination**,
and **Rspec** for **TDD**.

Best practices are used throughout the project to make the codes
easy to read and keep maintainability during the project.

The final project has been deployed on **Heroku** which is accessible with this URL :

        https://petalmd-api.herokuapp.com/api/v1/pokemons

and it could be tested with the **Postman**.

In this project, **Devise** and **Pundit** have been used for _authorization_ and _authentication_,
respectively. Besides, a **Simple Token Authentication** gem has been employed to send a
specific token related to user as a parameter.

## CRUD functions

Displaying all the Pokemons or a specific Pokemon is public. But, for _Create_, _Edit_,
and _Delete_ a Pokemon, **sign in** as a user.

That’s why it should be use these headers:

- **Usage headers**

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

        To create a pokemon set Usage Header and put json object in the Body of the request
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

        To update a pokemon  set Usage Header and put json object in the Body of the request

- Delete

        DELETE # Delete a specific pokemon
            https://petalmd-api.herokuapp.com/api/v1/pokemons/:id

        To update a pokemon  set Usage Header and put json object in the Body of the request

## SEARCH

In this project, **pg_search** has been used for searching. Powerful searchability and easy-to-read are
the most practical characteristics of **pg_search** instead of _ActiveRecord search_.

**Elasticsearch** is another great option to search, however, there was some limitation about deploying
the project on **Heroku**, which’s why **pg_search** has been chosen.

Data could be searched based on _name_, _type 1_, and _type 2_.
To pass a _query_ (URL/?q=(name or type_1 or type_2)) to the URL to search a pokemon from the list as demonstrated:

    If pokemon with id=8 has a name like "CharizardMega Charizard Y" it could be find :

        https://petalmd-api.herokuapp.com/api/v1/pokemons?q=CharizardMega Charizard Y
        https://petalmd-api.herokuapp.com/api/v1/pokemons?q=Charizard
        https://petalmd-api.herokuapp.com/api/v1/pokemons?q=chari
        https://petalmd-api.herokuapp.com/api/v1/pokemons?q=Y

        for all of the URLs find pokemons

## PAGINATION

**Kaminari** gem is used for pagination. It has been created for frontend developers to have
easy access and easy navigation within the pages.

Pagination includes the _Total Count_ of
pokemon, _first page_ and _last page_, _previous page_ and _next page_.

**Page** and **par_page** could pass to the URL as a parameter to get the pagination.
There are 10 pokemon on every page by default.

        https://petalmd-api.herokuapp.com/api/v1/pokemons
        By default  every page 10 pokemons ... starting from id = 1

However, it is possible to change the _page_ and _per_page_ of the pagination,
directly on the endpoint address. for example:

        https://petalmd-api.herokuapp.com/api/v1/pokemons?page=5&per_page=50
        every page 50 pokemons .... starting from id = 201

On Postmen, the links of pagination are displayed on headers, for instance:

        If choose page 10:
        https://petalmd-api.herokuapp.com/api/v1/pokemons?page=10

        links:

        <https://petalmd-api.herokuapp.com/api/v1/pokemons{"page"=>1}>; rel='first',
        <https://petalmd-api.herokuapp.com/api/v1/pokemons{"page"=>9}>; rel='prev',
        <https://petalmd-api.herokuapp.com/api/v1/pokemons{"page"=>11}>; rel='next',
        <https://petalmd-api.herokuapp.com/api/v1/pokemons{"page"=>80}>; rel='last'

## TEST

**Rspect** is used for testing the project. To run the test need to clone the code
from **GitHub** repositiory and run it on your local machine.

here is the test file:

        ./spec/models/pokemons_spec.rb
        ./spec/requests/api/v1/pokemons_spec.rb

to execute the test:

        bundle exec rspec ./spec/models/pokemons_spec.rb --format documentation
