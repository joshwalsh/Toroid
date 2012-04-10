require 'game'

Given /^the current year is (\d+)$/ do |arg1|
  @game = Game.current
  @game.year = year.to_i
  PersistState.save(@game)
end

Given /^I visit the game page$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I run the game for a year$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the current year should be (\d+)$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given /^a planet exists with attributes:$/ do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end