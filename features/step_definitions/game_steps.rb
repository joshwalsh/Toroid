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