require 'spec_helper'

describe Tordoid::Game do
  subject { Tordoid::Game.new 10, 10 }

  context 'new game' do
    it "creates a planet" do
      subject.planet.size.should == 100 
    end
  end

  context 'game runs' do
    it "coordinates tasks for each run" do
      subject.planet = mock('planet')
      subject.planet.stub(:occupied_cells) { {} }
      subject.planet.should_receive(:age).exactly(3).times
      subject.run 3
    end
  end
end
