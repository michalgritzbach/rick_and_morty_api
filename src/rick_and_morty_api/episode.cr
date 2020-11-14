module RickAndMortyApi
  class Episode
    include JSON::Serializable

    @endpoint = "episode"

    getter id : Int64
    getter name : String
    getter air_date : String
    getter episode : String

    @[JSON::Field(key: "characters")]
    getter character_urls : Array(String)

    getter url : String

    @[JSON::Field(key: "created")]
    getter created_at : Time
  end
end
