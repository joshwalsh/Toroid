Given /^a planet exists with attributes:$/ do |table|
  @planet = Planet.create table.rows_hash
end

When /^I view the page for that planet$/ do
  visit planet_path @planet
end

Then /^I should see the planets name: "([^"]*)"$/ do |name|
  page.should have_content(name)
end

Given /^the planet has organisms with attributes:$/ do |table|
  table.hashes.each do |attributes|
    @planet.organisms.build attributes
  end

  @planet.save
end

Then /^I should see a visual representation of the planet$/ do
  page.should have_selector("canvas")
end

Then /^I should see a list of organisms:$/ do |table|
  table.hashes.each do |organism|
    page.should have_content(organism[:name])
  end
end
