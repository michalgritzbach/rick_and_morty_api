module RickAndMortyApi
  class Client
    {% for entity in %w{character episode location} %}
      # Gets list of all `{{entity.id.capitalize}}`s.
      def all_{{entity.id}}s(page : UInt64 = 1) : Array({{entity.id.capitalize}})
        response = get("/api/{{entity.id}}/", {"page" => page.to_s})

        Array({{entity.id.capitalize}}).from_json(response, root: "results")
      end

      # Gets a single `{{entity.id.capitalize}}`.
      def {{entity.id}}(id : UInt64) : {{entity.id.capitalize}}
        response = get("api/{{entity.id}}/#{id}")

        {{entity.id.capitalize}}.from_json(response)
      end

      # Gets list of multiple `{{entity.id.capitalize}}`s.
      def {{entity.id}}s(*ids : UInt64) : Array({{entity.id.capitalize}})
        response = get("api/{{entity.id}}/#{ids.join(",")}")

        Array({{entity.id.capitalize}}).from_json(response)
      end

      # Gets list of multiple `{{entity.id.capitalize}}`s.
      def {{entity.id}}s(**params) : Array({{entity.id.capitalize}})
        response = get("api/{{entity.id}}/", params.to_h)

        Array({{entity.id.capitalize}}).from_json(response, root: "results")
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
