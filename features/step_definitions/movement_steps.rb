require 'rspec/mocks/standalone'

Given /^there is an organism on the board$/ do
  @game.planet[3,3] = 'barb'
end

Then /^it should not be where it started$/ do
  @game.planet[3,3].should be_nil
end

Then /^it should be moved to an adjacent cell$/ do
  Tordoid::CellNavigator.any_instance.stub(:select_random_coordinate_from_set) { [2,3] }

  @game.planet[2,3].should == 'barb'
end
