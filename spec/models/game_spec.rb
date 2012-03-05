require 'lean_spec_helper'
require 'app/models/game'

describe Game do
  it "loads the existing game" do
    PersistState.stub(:load => Game.new)
    Game.current.class.should == Game
  end

  it "creates a new game if one doesn't exist" do
    PersistState.stub(:load => false)
    Game.current.class.should == Game
  end
end
