Given /^the current year is (\d+)$/ do |year|
  @game = Game.current
  @game.year = year
  @game.save
end

When /^I visit the game page$/ do
  visit '/'
end

When /^I run the game for a year$/ do
  click_button "Run"
end

Then /^the current year should be (\d+)$/ do |year|
  page.should have_content("Year: #{year}")
end

When /^I visit the game logs$/ do
  visit game_logs_path
end

Then /^the time log should include "([^"]*)"$/ do |log_line|
  page.should have_content(log_line)
end
