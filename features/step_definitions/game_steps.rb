require 'game'
require 'planet_populator'

Given /^I have not started a game$/ do
  @game = nil
end

Given /^I have started a game$/ do
  @game = Game.new
end

When /^I start a game$/ do
  @game = Game.new
end

When /^I populate the planet$/ do
  @game.populate 15
end

When /^I add an organism to the planet$/ do
  @game.planet[0,0] = 'barb'
end

When /^the planet ages (\d+) years$/ do |days|
  @game.run days.to_i
end

Then /^I should have an empty planet$/ do
  @game.planet.should be_empty
end

Then /^it should exist on the planet$/ do
  @game.planet[0,0].should == 'barb'
end

Then /^I should have a planet with organisms$/ do
  @game.planet.occupied_cells.size.should == 15
end

Then /^the planet should be (\d+) years older$/ do |arg1|
  @game.planet.generation.should == 10
end
