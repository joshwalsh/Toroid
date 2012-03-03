require 'spec_helper'

step "the current year is :year" do |year|
  @game = Game.current
  @game.year = year
  @game.save
end

step "I visit the game page" do
  visit '/'
end

step "I run the game for a year" do
  click_button "Run"
end

step "the current year should be :current_year" do |current_year|
  page.should have_content("Year: #{current_year}")
end

step "a planet exists with attributes:" do |table|
  @planet = Planet.create table.rows_hash
end

step "I visit the game logs" do 
  visit game_logs_path
end

step "the time log should include :activity" do |activity|
  page.should have_content(activity)
end