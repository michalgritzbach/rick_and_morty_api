module RickAndMortyApi
  class Client
    # Defines methods related to Character.
    #
    # Character pagination
    #
    # Returns 30 characters per page.
    #
    # See [https://rickandmortyapi.com/documentation/#character](https://rickandmortyapi.com/documentation/#character).
    module Character
      # Gets list of all characters.
      #
      # - param [UInt64] page
      # - return [Array(RickAndMortyApi::Character)] list of characters
      #
      # ```
      # client.all_characters
      # client.all_characters(3)
      # ```
      def all_characters(page : UInt64 = 1) : Array(RickAndMortyApi::Character)
        response = get("/api/character/", {"page" => page.to_s})

        Array(RickAndMortyApi::Character).from_json(response, root: "results")
      end

      # Gets a single character.
      #
      # - param [UInt64] id
      # - return [RickAnyMortyApi::Character]
      #
      # ```
      # client.character(1)
      # ```
      def character(id : UInt64) : RickAndMortyApi::Character
        response = get("api/character/#{id}")

        RickAndMortyApi::Character.from_json(response)
      end

      # Gets list of multiple characters.
      #
      # - param [Array(UInt64)] ids
      # - return [Array(RickAndMortyApi::Character)] list of characters
      #
      # ```
      # client.characters(1, 2, 3)
      # ```
      def characters(*ids : UInt64) : Array(RickAndMortyApi::Character)
        response = get("api/character/#{ids.join(",")}")

        Array(RickAndMortyApi::Character).from_json(response)
      end

      # Gets list of multiple characters.
      #
      # - param [Hash] params
      # - return [Array(RickAndMortyApi::Character)] list of characters
      #
      # ```
      # client.characters({gender: Male})
      # ```
      def characters(**params) : Array(RickAndMortyApi::Character)
        response = get("api/character/", params.to_h)

        Array(RickAndMortyApi::Character).from_json(response, root: "results")
      end
    end
  end
end
