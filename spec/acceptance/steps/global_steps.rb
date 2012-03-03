step "I visit the game page" do
  visit '/'
end

step "I run the game for a year" do
  visit '/'
  click_button "Run"
end

step "I visit the game logs" do 
  visit game_logs_path
end