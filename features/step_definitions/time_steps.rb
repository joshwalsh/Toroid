require 'game'

Then /^the current year should be (\d+)$/ do |current_year|
  visit "/"
  find('[data-year]').should have_content(current_year)
end

