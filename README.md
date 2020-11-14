# Rick and Morty API shard

[![GitHub release](https://img.shields.io/github/release/michalgritzbach/rick_and_morty_api.svg)](https://github.com/michalgritzbach/rick_and_morty_api/releases)
[![Build Status](https://travis-ci.org/michalgritzbach/rick_and_morty_api.svg?branch=master)](https://travis-ci.org/michalgritzbach/rick_and_morty_api)

Crystal implementation of the [Rick and Morty API](https://rickandmortyapi.com).

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     rick_and_morty_api:
       github: michalgritzbach/rick_and_morty_api
   ```

2. Run `shards install`

## Usage

First step is to require the library and initialize the client.

```crystal
require "rick_and_morty_api"

client = RickAndMortyApi::Client.new # or RickAndMortyApi.client
```

After that, you can call methods on `client`. There are four methods with the same signature for getting characters, episodes and locations.

```crystal
# List all characters
client.all_characters
# => [RickAndMortyApi::Character{}, …]

# Single character
client.character(1)
# => RickAndMortyApi::Character{}

# Multiple characters by IDs
client.characters(1, 2, 3)
# => [RickAndMortyApi::Character{}, …]

# Multiple characters filtered by params
client.characters(name: "Rick")
# => [RickAndMortyApi::Character{}, …]
```

## Development

After forking the repo, don't forget to run `shards install` to install its dependencies. Very simple client specs are in `specs` folder, don't forget to run `crystal spec` to confirm that its working state.

To release a new version, bump the `VERSION` constant in `src/rick_and_morty_api.cr` and `shard.yml`.

## Contributing

1. Fork it (<https://github.com/michalgritzbach/rick_and_morty_api/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Michal Gritzbach](https://github.com/michalgritzbach) - creator and maintainer
