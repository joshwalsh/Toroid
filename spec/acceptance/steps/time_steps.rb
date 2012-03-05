steps_for :time do
  step "the current year should be :current_year" do |current_year|
    page.should have_content("Year: #{current_year}")
  end

  step "the current year is :year" do |year|
    @game = Game.current
    @game.year = year.to_i
    PersistState.save(@game)
  end
end