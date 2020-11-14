require "./client/**"

module RickAndMortyApi
  class Client
    private def get(path : String, params = {} of String => String)
      response = Crest.get(
        "#{BASE_URL}/#{path}",
        params: params # logging: true
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

    include Character
    include Episode
  end
end
