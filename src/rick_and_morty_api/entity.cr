module RickAndMortyApi
  module Entity(T)
    def self.all(page : UInt64 = 1) : Array(T)
      response = client.get("/api/#{endpoint}", {"page" => page.to_s})

      Array(T).from_json(response, root: "results")
    end
  end
end
