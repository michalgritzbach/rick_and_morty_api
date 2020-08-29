module RickAndMortyApi
  class Episode
    include JSON::Serializable

    getter name : String
    getter url : String
  end
end
