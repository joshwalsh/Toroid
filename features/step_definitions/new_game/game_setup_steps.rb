require 'game'

Given /^I have not started a game$/ do
  @game = nil
end

When /^I start a game$/ do
  @game = Game.new
end

Then /^I should have an empty planet$/ do
  @game.planet.should be_empty
end

