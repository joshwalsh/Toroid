require 'planet_populator'

When /^I populate the planet$/ do
  populator = PlanetPopulator.new @game.planet
  populator.populate 15
end

Then /^I should have a planet with organisms$/ do
  @game.planet.occupied_cells.size.should == 15
end
