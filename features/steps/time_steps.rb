steps_for :time do
  step "the current year should be :current_year" do |current_year|
    visit "/"
    page.should have_content("Year: #{current_year}")
  end
end