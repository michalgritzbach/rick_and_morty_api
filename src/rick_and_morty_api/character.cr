require "./entity"

module RickAndMortyApi
  class Character
    include JSON::Serializable

    @endpoint = "character"

    enum Status
      Alive
      Dead
      Unknown
    end

    enum Gender
      Male
      Female
      Genderless
      Unknown
    end

    # alias FilterParams = {name: String?, status: Status?, gender: Gender?, species: String?, race: String?}

    getter id : Int64
    getter name : String

    @[JSON::Field(converter: Enum::StringConverter(RickAndMortyApi::Character::Status))]
    getter status : Status

    getter species : String

    @[JSON::Field(key: "type")]
    getter race : String

    @[JSON::Field(converter: Enum::StringConverter(RickAndMortyApi::Character::Gender))]
    getter gender : Gender

    getter origin : Addressable
    getter location : Addressable

    getter image : String

    @[JSON::Field(key: "episode")]
    getter episodes : Array(String)

    getter url : String

    @[JSON::Field(key: "created")]
    getter created_at : Time
  end
end
