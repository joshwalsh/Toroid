require 'spec_helper'

describe Game do
  context "Run" do
    subject {
      game = Game.current
      game.year = 1
      game
    }

    it "runs a single year" do
      subject.run_for_years
      subject.year.should == 2
    end

    it "runs multiple years" do
      subject.run_for_years 3
      subject.year.should == 4
    end
  end
end
