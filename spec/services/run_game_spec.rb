require 'lean_spec_helper'
require 'app/services/run_game'
require 'app/models/game'
require 'app/models/log'
require 'app/models/planet'

describe RunGame do
  context "Run" do
    let(:game) {
      g = Game.new
      g.year = 1
      g
    }
    subject { RunGame.new game }

    it "runs a single year" do
      subject.for_year
      game.year.should == 2
    end

    it "runs multiple years" do
      subject.for_years 3
      game.year.should == 4
    end
  end
end
