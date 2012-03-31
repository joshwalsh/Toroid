step "I run the game for a year" do
  click_link "Run"
end

step "I visit the game page" do 
  visit "/"
end

step "the current year is :year" do |year|
  @game = Game.current
  @game.year = year.to_i
  PersistState.save(@game)
end
