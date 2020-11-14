require "json"
require "crest"
require "uri"
require "./ext/**"

module RickAndMortyApi
  BASE_URL = URI.parse("https://rickandmortyapi.com")
  VERSION  = "0.1.0"

  # Alias for RickAndMortyApi::Client.new
  def self.client : Client
    Client.new
  end
end

require "./rick_and_morty_api/**"
