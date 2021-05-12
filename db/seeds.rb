# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Pokemon.destroy_all

pokemons_json = RestClient.get "https://pokeapi.co/api/v2/pokemon"

pokemons= JSON.parse(pokemons_json)["results"]


pokemons.each do |pokemon| 
    newPokemon = Pokemon.new
    newPokemon.name = pokemon["name"]
    newPokemon.url = pokemon["url"]
    newPokemon.save
end
