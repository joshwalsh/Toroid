require 'planet'

Given /^a planet exists with attributes:$/ do |table|
  @planet = Planet.new @game

  table.rows_hash.each do |key, value|
    @planet.send(:"#{key}=", value)
  end

  @game.planets << @planet
  PersistState.save(@game)
end

Given /^I view the planets list page$/ do
  visit planets_path
end

When /^I request a new planet$/ do
  click_link 'Add a planet'
end

When /^I fill in the new planet form with:$/ do |table|
  table.hashes.each do |hash|
    fill_in hash['key'], with: hash['value']
  end

  click_button "Create Planet"
end

Then /^I should be on the planet show page for the planet "([^"]*)"$/ do |planet_name|
  current_path.should == planet_path(planet_name.parameterize)
end

Then /^I should see the planets name: "([^"]*)"$/ do |name|
  page.should have_content(name)
end

When /^I view the page for that planet$/ do
  visit planet_path @planet
end

When /^I should see the planets age: "([^"]*)"$/ do |age|
  find('[data-age]').should have_content(age)
end

Given /^the planet has an organism with attributes:$/ do |table|
  step "the planet has organisms with attributes:", table
end

Given /^the planet has organisms with attributes:$/ do |table|
  table.hashes.each do |attributes|
    organism = Organism.new

    attributes.each do |key, value|
      organism.send(:"#{key}=", value)
    end

    @planet.organisms << organism
  end
  PersistState.save(@game)
end

When /^I view the page with organisms scoped by planet$/ do
  visit planet_organisms_path @planet
end

Then /^I should see the planets birth year: "([^"]*)"$/ do |birth_year|
  find('[data-birthyear]').should have_content(birth_year)
end

Then /^I should see organisms on the grid:$/ do |table|
  table.hashes.each do |organism|
    x = organism["x"]
    y = organism["y"]
    name = organism["name"]

    page.should have_css("[data-x=\"#{x}\"][data-y=\"#{y}\"][data-name=\"#{name}\"]")
  end
end
