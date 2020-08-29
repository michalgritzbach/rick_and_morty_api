module RickAndMortyApi
  class Addressable
    include JSON::Serializable

    property name : String
    property url : String
  end
end
