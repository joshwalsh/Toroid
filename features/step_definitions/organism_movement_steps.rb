require 'rspec/mocks/standalone'

Given /^the system will navigate the organism at (\d+),(\d+) to (\d+), (\d+)$/ do |from_x, from_y, to_x, to_y|
  @planet_occupancy = PlanetOccupancy.new @planet
  @organism = @planet_occupancy.organism_at_coordinate(from_x, from_y)

  PlanetOccupancy.any_instance.stub(:select_random_adjacent_coordinate) { [to_x, to_y] }
end

Then /^the organism should not be at (\d+), (\d+)$/ do |x, y|
  @planet_occupancy.organism_at_coordinate(x, y).should be_nil
end

Then /^the organism should be at (\d+), (\d+)$/ do |x, y|
  @planet_occupancy.organism_at_coordinate(x, y).should == @organism
end
