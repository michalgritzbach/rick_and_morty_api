require "../../spec_helper"

describe RickAndMortyApi::Client::Character do
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
