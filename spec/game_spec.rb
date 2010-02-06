require 'game'

describe Game do
  context 'new game' do
    it "creates a planet" do
      @game = Game.new(10,10)

      @game.planet.size.should == 100 
    end
  end
end
