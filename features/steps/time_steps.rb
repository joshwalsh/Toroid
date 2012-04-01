steps_for :time do
  step "the current year should be :current_year" do |current_year|
    visit "/"
    find('[data-year]').should have_content(current_year)
  end
end