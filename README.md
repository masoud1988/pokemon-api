# Pokemones API

### PetalMD

## CRUD functions

That is how you may use each of the CRUD requests:

- Read

        GET # List all pokemons  https://petalmd-api.herokuapp.com/api/v1/pokemons
        GET # Show a specific pokemon https://petalmd-api.herokuapp.com/api/v1/pokemons/1

- Create

        POST # Create a new pokemon
            https://petalmd-api.herokuapp.com/api/v1/pokemons

        to create a pokemon set *Header* as mention at the top and put json object in the *Body* of the request
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

        to update a pokemon  set *Header* as mention at the top and put json object in the *Body* of the request

- Delete
  DELETE # Delete a specific pokemon
  https://petalmd-api.herokuapp.com/api/v1/pokemons/:id
  to delete the mentioned pokemon's profile

#

- response body structure

       It consists of four parts
       - status
       - message
       - data
       - error (Just in case of having error)

- Paginated response

       https://petalmd-api.herokuapp.com/api/v1/pokemons
       By default  every page 10 pokemons . starting from id = 1

       However, it is possible to change the offset and limit of the pagination, directly on the endpoint address. for example

       http://localhost:3000/api/v1/pokemons?page=5&per_page=50
       every page 50 pokemons . starting from id = 201

---

## TEST DRIVEN DEVELOPMENT

The controller is developed and refactored based on implementing unit tests using RSPEC.
here is the test file:
./spec/requests/status_spec.rb

There is also a small test on Pokemon Model to check the validation of data:
./spec/requests/pokemon_model_spec.rb

To run the test need to clone the code from GitHub repositiory and run it on your local machine.

        bundle exec rspec spec/requests/status_spec.rb --format documentation

- Pokemon Model test - bundle exec rspec spec/requests/pokemon_model_spec.rb --format documentation

        It would be better to use more gem to provide a better test senarios and it could be write less code.

---

# # Way to go

There are other considerations needs to be applied. But I ignore it for the moment due to lack of time and also some technical issues with my old laptop. Here I mention some of them:

- SSL

         It is neccessary for the security reason to activate https port and communicate through it. I can do that via server firewall setting or by using services like [CloudFlare](https://www.cloudflare.com/).
         https://www.cloudflare.com

- More unit tests

       Add more tests on each request block to cover all possible origin of errors

- Validate all pokemons attributes

       Validate inputs structure/type in the Pokemon.rb, at least for "legend" which must to be a false/true.

- User Authentication

        It would be more secure to add a authentication procedure to limit the access to the API

- Employ more gems

        Gems provide more option and somethimes less coding how ever i tried to keep it simple. for example it is also possible to handle the pagination using "kaminari" gem.

- Auto Deploy

        for the moment the app needs to be deployed manually after each push on github. however it is possible to activate an automated deployment using webhooks.
