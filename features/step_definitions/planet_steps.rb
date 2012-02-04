Given /^a planet exists with attributes:$/ do |attributes|
  @planet = Planet.create attributes.rows_hash
end

When /^I view the page for that planet$/ do
  visit planet_path @planet
end

Then /^I should see the planets name: "([^"]*)"$/ do |name|
  page.has_content? name
end
