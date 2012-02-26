require 'rspec/mocks/standalone'

Given /^the system will navigate the organism to an adjacent cell at (\d+), (\d+)$/ do |x, y|
  @planet_occupancy = PlanetOccupancy.new(@planet)
  @planet_occupancy.stub(:select_random_adjacent_coordinate) { [x, y] }
end

Then /^the organism should not be where it started$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the organism should be moved to an adjacent cell$/ do
  pending # express the regexp above with the code you wish you had
end
