module RickAndMortyApi
  class Location
    include JSON::Serializable

    getter id : Int64
    getter name : String

    @[JSON::Field(key: "type")]
    getter location_type : String

    getter dimension : String

    @[JSON::Field(key: "residents")]
    getter resident_urls : Array(String)

    getter url : String

    @[JSON::Field(key: "created")]
    getter created_at : Time
  end
end
