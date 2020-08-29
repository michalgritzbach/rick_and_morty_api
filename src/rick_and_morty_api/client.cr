module RickAndMortyApi
  class Client
    def list_characters(page : UInt64 = 1) : Array(Character)
      response = get("/api/character/", {"page" => page.to_s})

      Array(Character).from_json(response, root: "results")
    end

    def get_character(id : UInt64) : Character
      response = get("api/character/#{id}")

      Character.from_json(response)
    end

    def get_multiple_characters(*ids) : Array(Character)
      response = get("api/character/#{ids.join(",")}")

      Array(Character).from_json(response)
    end

    def filter_characters(params : Character::FilterParams)
      params = Crest::ParamsEncoder.encode(params)
      response = get("api/character/#{params}")

      Array(Character).from_json(response)
    end

    private def get(path : String, params = {} of String => String)
      response = Crest.get(
        "#{BASE_URL}/#{path}",
        params: params,
        logging: true
      )

      handle_response(response)
    end

    private def handle_response(response : Crest::Response)
      case response.status_code
      when 200..299
        response.body
      else
        raise "#{response.status_code} - #{response.body}"
      end
    end
  end
end
