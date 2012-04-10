require 'game'

Given /^the current year is (\d+)$/ do |year|
  @game = Game.current
  @game.year = year.to_i
  PersistState.save(@game)
end

Given /^I visit the game page$/ do
  visit "/"
end

When /^I run the game for a year$/ do
  click_button "Run"
end

Then /^show me the page$/ do
  save_and_open_page
end

Then /^I should see a flash message: "([^"]*)"$/ do |message|
  page.should have_content(message)
end

