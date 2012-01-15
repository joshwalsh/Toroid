Given /^I have not started a game$/ do
  @game = nil
end

Given /^I have started a game$/ do
  @game = Toroid::Game.new 10, 10
end

Given /^I start a game with (\d+) organisms$/ do |arg1|
  @game = Toroid::Game.new 10, 10, 15
end

When /^I start a game$/ do
  @game = Toroid::Game.new
end

When /^I add an organism to the planet$/ do
  @game.planet[0,0] = 'barb'
end

When /^the planet ages (\d+) years*$/ do |days|
  @game.run days.to_i
end

Then /^I should have an empty planet$/ do
  @game.planet.should be_empty
end

Then /^it should exist on the planet$/ do
  @game.planet[0,0].should == 'barb'
end

Then /^I should have a planet with (\d+) organisms$/ do |number_organisms|
  @game.planet.occupied_cells.size.should == number_organisms.to_i
end

Then /^the planet should be (\d+) years older$/ do |years|
  @game.planet.year.should == years.to_i
end
