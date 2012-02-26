Given /^a planet exists with attributes:$/ do |table|
  @planet = Planet.create table.rows_hash
end

When /^I view the page for that planet$/ do
  visit planet_path @planet
end

Then /^I should see the planets name: "([^"]*)"$/ do |name|
  page.should have_content(name)
end

Then /^I should see the planets birth year: "([^"]*)"$/ do |birth_year|
  page.should have_content("Birth Year: #{birth_year}")
end

Then /^I should see the planets age: "([^"]*)"$/ do |age|
  page.should have_content("Age: #{age}")
end

Given /^the planet has organisms with attributes:$/ do |table|
  table.hashes.each do |attributes|
    @planet.organisms.build attributes
  end

  @planet.save
end

Given /^the planet has an organism with attributes:$/ do |table|
  Given "the planet has organisms with attributes:", table
end

Then /^I should see a list of organisms:$/ do |table|
  table.hashes.each do |organism|
    page.should have_content(organism[:name])
  end
end

When /^I view the planets list page$/ do
  visit planets_path
end

When /^I view the page with organisms scoped by planet$/ do
  visit planet_organisms_path @planet
end