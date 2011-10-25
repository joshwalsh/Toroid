require 'spec_helper'

describe Tordoid::Game do
  context 'new game' do
    it "creates a planet" do
      @game = Tordoid::Game.new(10,10)

      @game.planet.size.should == 100 
    end
  end

  context 'game runs' do
    it "coordinates tasks for each run" do
      @game = Tordoid::Game.new(10,10)
      @game.planet = mock('planet')
      @game.planet.should_receive(:age).exactly(3).times
      @game.run 3
    end
  end
end
