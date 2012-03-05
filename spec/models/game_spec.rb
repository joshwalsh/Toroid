require 'lean_spec_helper'
require 'app/models/game'
require 'app/services/persist_state'

describe Game do
  it "loads the existing game" do
    PersistState.stub(:load => Game.new)
    Game.current.class.should == Game
  end

  it "creates a new game if one doesn't exist" do
    PersistState.stub(:load => false)
    Game.current.class.should == Game
  end

  it "logs an activity" do
    g = Game.new
    g.log "testing log file"
    g.logs.last.should == "testing log file"
  end
end