module RickAndMortyApi
  class Client
    {% for entity in %w{character episode location} %}
      # Gets list of all {{entity.id}}s.
      #
      # - param [UInt64] page
      # - return [Array(RickAndMortyApi::{{entity.id.capitalize}})] list of {{entity.id}}s
      #
      # ```
      # client.all_{{entity.id}}s
      # client.all_{{entity.id}}s(3)
      # ```
      def all_{{entity.id}}s(page : UInt64 = 1) : Array(RickAndMortyApi::{{entity.id.capitalize}})
        response = get("/api/{{entity.id}}/", {"page" => page.to_s})

        Array(RickAndMortyApi::{{entity.id.capitalize}}).from_json(response, root: "results")
      end

      # Gets a single {{entity.id}}.
      #
      # - param [UInt64] id
      # - return [RickAnyMortyApi::Character]
      #
      # ```
      # client.{{entity.id}}(1)
      # ```
      def {{entity.id}}(id : UInt64) : RickAndMortyApi::{{entity.id.capitalize}}
        response = get("api/{{entity.id}}/#{id}")

        RickAndMortyApi::{{entity.id.capitalize}}.from_json(response)
      end

      # Gets list of multiple {{entity.id}}s.
      #
      # - param [Array(UInt64)] ids
      # - return [Array(RickAndMortyApi::{{entity.id.capitalize}})] list of {{entity.id}}s
      #
      # ```
      # client.{{entity.id}}s(1, 2, 3)
      # ```
      def {{entity.id}}s(*ids : UInt64) : Array(RickAndMortyApi::{{entity.id.capitalize}})
        response = get("api/{{entity.id}}/#{ids.join(",")}")

        Array(RickAndMortyApi::{{entity.id.capitalize}}).from_json(response)
      end

      # Gets list of multiple {{entity.id}}s.
      #
      # - param [Hash] params
      # - return [Array(RickAndMortyApi::{{entity.id.capitalize}})] list of {{entity.id}}s
      #
      # ```
      # client.{{entity.id}}s({gender: Male})
      # ```
      def {{entity.id}}s(**params) : Array(RickAndMortyApi::{{entity.id.capitalize}})
        response = get("api/{{entity.id}}/", params.to_h)

        Array(RickAndMortyApi::{{entity.id.capitalize}}).from_json(response, root: "results")
      end
    {% end %}

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
  end
end
