require 'spec_helper'

describe RunGame do
  context "Run" do
    let(:game) {
      game = Game.current
      game.year = 1
      game
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
