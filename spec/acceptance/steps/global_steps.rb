step "I run the game for a year" do
  visit "/"
  click_button "Run"
end

step "I visit the game logs" do 
  visit game_logs_path
end

step "the current year is :year" do |year|
  @game = Game.current
  @game.year = year.to_i
  PersistState.save(@game)
end
