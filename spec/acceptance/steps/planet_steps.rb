step "a planet exists with attributes:" do |table|
  @planet = Planet.create table.rows_hash
end

step "I view the page for that planet" do
  visit planet_path @planet
end

step "I should see the planets name: :name" do |name|
  page.should have_content(name)
end

step "I should see the planets birth year: :birth_year" do |birth_year|
  page.should have_content("Birth Year: #{birth_year}")
end

step "I should see the planets age: :age" do |age|
  page.should have_content("Age: #{age}")
end

step "the planet has organisms with attributes:" do |table|
  table.hashes.each do |attributes|
    @planet.organisms.build attributes
  end

  @planet.save
end

step "the planet has an organism with attributes:" do |table|
  Given "the planet has organisms with attributes:", table
end

step "I should see a list of organisms:" do |table|
  table.hashes.each do |organism|
    page.should have_content(organism[:name])
  end
end

step "I view the planets list page" do
  visit planets_path
end

step "I view the page with organisms scoped by planet" do
  visit planet_organisms_path @planet
end