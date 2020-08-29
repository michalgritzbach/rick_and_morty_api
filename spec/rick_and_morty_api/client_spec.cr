require "../spec_helper"

describe RickAndMortyApi::Client do
  it "lists all characters" do
    load_cassette("list_characters") do
      characters = RickAndMortyApi::Client.new.list_characters
      characters.first.name.should eq("Rick Sanchez")
    end
  end

  it "lists a single character" do
    load_cassette("get_character") do
      character = RickAndMortyApi::Client.new.get_character(1)
      character.name.should eq("Rick Sanchez")
    end
  end

  it "lists multiple characters" do
    load_cassette("get_multiple_characters") do
      characters = RickAndMortyApi::Client.new.get_multiple_characters(1, 2, 3)
      characters.first.name.should eq("Rick Sanchez")
    end
  end

  it "lists filtered characters" do
    load_cassette("filter_characters") do
      characters = RickAndMortyApi::Client.new.filter_characters(RickAndMortyApi::Character::FilterParams{"name" => "Rick", "status" => :dead})
      characters.first.name.should eq("Rick Sanchez")
    end
  end
end
