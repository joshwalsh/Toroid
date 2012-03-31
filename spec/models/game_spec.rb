require 'lean_spec_helper'
require 'app/models/game'
require 'app/models/planet'
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

  context "Finding" do
    it "finds a planet by parameterized name" do
      g = Game.new

      p = Planet.new g
      p.name = "Earth"
      p.stub(:to_param => "earth")

      g.planets << p

      g.find_planet('earth').name.should == "Earth"
    end
  end
end