require "lean_spec_helper"
require "app/services/persist_state"

describe PersistState do
  it "writes the game file to an io object" do
    StringIO.open("game already saved", "w+") do |game_content|
      p = PersistState.new game_content
      p.save("new game to save")
      game_content.read.should eq("new game to save")
    end
  end

  it "reads the game file from an io object" do
    StringIO.open("existing game contents", "r") do |game_content|
      p = PersistState.new game_content
      p.load.should eq("existing game contents")
    end
  end
end