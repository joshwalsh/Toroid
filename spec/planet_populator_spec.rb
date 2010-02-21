require 'planet_populator'
require 'planet'

describe PlanetPopulator do
  before(:each) do
    @planet = Planet.new 10,10
    @populator = PlanetPopulator.new @planet
  end

  it "generates a random coordinate" do
    x,y = @populator.generate_random_coordinate

    (0...@planet.width).should include(x)
    (0...@planet.height).should include(y)
  end

  it "populates the planet" do
    @populator.populate 25
    @planet.occupied_cells.size.should == 25
  end
end
