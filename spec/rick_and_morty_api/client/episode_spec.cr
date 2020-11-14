require "../../spec_helper"

describe RickAndMortyApi::Client::Episode do
  it "lists all episodes" do
    load_cassette("all_episodes") do
      episodes = RickAndMortyApi.client.all_episodes
      episodes.first.name.should eq("Pilot")
    end
  end

  it "lists a single episode" do
    load_cassette("episode") do
      episode = RickAndMortyApi.client.episode(1)
      episode.name.should eq("Pilot")
    end
  end

  it "lists multiple episodes" do
    load_cassette("multiple_episodes") do
      episodes = RickAndMortyApi.client.episodes(1, 2, 3)
      episodes.first.name.should eq("Pilot")
    end
  end

  it "lists filtered episodes" do
    load_cassette("filter_episodes") do
      episodes = RickAndMortyApi.client.episodes(name: "Pilot")
      episodes.first.name.should eq("Pilot")
    end
  end
end
