step "I run the game for a year" do
  click_button "Run"
end

step "I visit the game page" do 
  visit "/"
end

step "the current year is :year" do |year|
  @game = Game.current
  @game.year = year.to_i
  PersistState.save(@game)
end

step "I should see a flash message: :message" do |message|
  page.should have_content(message)
end