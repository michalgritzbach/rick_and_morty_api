module RickAndMortyApi
  class Client
    # Defined methods related to Episode.
    #
    # Episode pagination
    #
    # Returns 30 episodes per page.
    #
    # See [https://rickandmortyapi.com/documentation/#episode](https://rickandmortyapi.com/documentation/#episode).
    module Episode
      # Gets list of all episodes.
      #
      # - params [UInt64] page
      # - return [Array(RickAndMortyApi::Episode)] list of episodes
      #
      # ```
      # client.all_episodes
      # client.all_episodes(3)
      # ```
      def all_episodes(page : UInt64 = 1) : Array(RickAndMortyApi::Episode)
        response = get("/api/episode/", {"page" => page.to_s})

        Array(RickAndMortyApi::Episode).from_json(response, root: "results")
      end

      # Gets a single episode.
      #
      # - param [UInt64] id
      # - return [RickAndMortyApi::Episode]
      #
      # ```
      # client.episode(1)
      # ```
      def episode(id : UInt64) : RickAndMortyApi::Episode
        response = get("api/episode/#{id}")

        RickAndMortyApi::Episode.from_json(response)
      end

      # Gets list of multiple episodes.
      #
      # - param [Array(UInt64)] ids
      # - return [Array(RickAndMortyApi::Episode)] list of episodes
      #
      # ```
      # client.episodes(1, 2, 3)
      # ```
      def episodes(*ids : UInt64) : Array(RickAndMortyApi::Episode)
        response = get("api/episode/#{ids.join(",")}")

        Array(RickAndMortyApi::Episode).from_json(response)
      end

      # Gets list of multiple episodes.
      #
      # - param [Hash] params
      # - return [Array(RickAndMortyApi::Episode)] list of episodes
      #
      # ```
      # client.episodes({gender: Male})
      # ```
      def episodes(**params) : Array(RickAndMortyApi::Episode)
        response = get("api/episode/", params.to_h)

        Array(RickAndMortyApi::Episode).from_json(response, root: "results")
      end
    end
  end
end
