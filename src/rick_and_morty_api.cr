require "json"
# require "http/client"
require "crest"
require "uri"
require "./ext/**"

module RickAndMortyApi
  BASE_URL = URI.parse("https://rickandmortyapi.com")
  VERSION  = "0.1.0"

  # client = Client.new

  # puts client.get_character(1)
  # puts client.get_multiple_characters(1, 2, 3)

  RickAndMortyApi::Character.all
end

require "./rick_and_morty_api/**"
