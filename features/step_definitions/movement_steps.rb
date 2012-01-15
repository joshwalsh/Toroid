require 'rspec/mocks/standalone'

Given /^there is an organism on the board$/ do
  @game.planet[3,3] = 'barb'
end

Given /^the system will navigate it to an adjacent cell$/ do
  Toroid::SelectRandomCoordinate.stub(:from_set) { [2,3] }
end

Then /^it should not be where it started$/ do
  @game.planet[3,3].should be_nil
end

Then /^it should be moved to an adjacent cell$/ do
  @game.planet[2,3].should == 'barb'
end
