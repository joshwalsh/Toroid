Given /^I have started a game$/ do
  @game = Game.new
end

When /^I add an organism to the planet$/ do
  @game.planet[0,0] = 'barb'
end

Then /^it should exist on the planet$/ do
  @game.planet[0,0].should == 'barb'
end

