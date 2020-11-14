require "../spec_helper"

describe RickAndMortyApi::Client do
  context "Character" do
    it "lists all characters" do
      load_cassette("list_characters") do
        characters = RickAndMortyApi.client.all_characters
        characters.first.name.should eq("Rick Sanchez")
      end
    end

    it "lists a single character" do
      load_cassette("get_character") do
        character = RickAndMortyApi.client.character(1)
        character.name.should eq("Rick Sanchez")
      end
    end

    it "lists multiple characters" do
      load_cassette("get_multiple_characters") do
        characters = RickAndMortyApi.client.characters(1, 2, 3)
        characters.first.name.should eq("Rick Sanchez")
      end
    end

    it "lists filtered characters" do
      load_cassette("filter_characters") do
        characters = RickAndMortyApi.client.characters(name: "Rick", status: :dead)
        characters.first.status.should eq(RickAndMortyApi::Character::Status::Dead)
      end
    end
  end

  context "Episode" do
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

  context "Location" do
    it "lists all locations" do
      load_cassette("all_locations") do
        locations = RickAndMortyApi.client.all_locations
        locations.first.name.should eq("Earth (C-137)")
      end
    end

    it "lists a single location" do
      load_cassette("location") do
        location = RickAndMortyApi.client.location(1)
        location.name.should eq("Earth (C-137)")
      end
    end

    it "lists multiple locations" do
      load_cassette("multiple_locations") do
        locations = RickAndMortyApi.client.locations(1, 2, 3)
        locations.first.name.should eq("Earth (C-137)")
      end
    end

    it "lists filtered locations" do
      load_cassette("filter_locations") do
        locations = RickAndMortyApi.client.locations(name: "Earth (C-137)")
        locations.first.name.should eq("Earth (C-137)")
      end
    end
  end
end
