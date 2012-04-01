steps_for :planet do
  step "a planet exists with attributes:" do |table|
    @planet = Planet.new @game

    table.rows_hash.each do |key, value|
      @planet.send(:"#{key}=", value)
    end

    @game.planets << @planet
    PersistState.save(@game)
  end

  step "the planet has organisms with attributes:" do |table|
    table.hashes.each do |attributes|
      organism = Organism.new

      attributes.each do |key, value|
        organism.send(:"#{key}=", value)
      end

      @planet.organisms << organism
    end
    PersistState.save(@game)
  end

  step "the planet has an organism with attributes:" do |table|
    step "the planet has organisms with attributes:", table
  end

  step "I view the page for that planet" do
    visit planet_path @planet
  end

  step "I should see the planets name: :name" do |name|
    page.should have_content(name)
  end

  step "I should see the planets birth year: :birth_year" do |birth_year|
    find('[data-birthyear]').should have_content(birth_year)
  end

  step "I should see the planets age: :age" do |age|
    find('[data-age]').should have_content(age)
  end

  step "I should see a list of organisms:" do |table|
    table.hashes.each do |organism|
      page.should have_content(organism[:name])
    end
  end

  step "I should see organisms on the grid:" do |table|
    table.hashes.each do |organism|
      x = organism["x"]
      y = organism["y"]
      name = organism["name"]

      page.should have_css("[data-x=\"#{x}\"][data-y=\"#{y}\"][data-name=\"#{name}\"]")
    end
  end

  step "I view the planets list page" do
    visit planets_path
  end

  step "I request a new planet" do
    click_link 'Add a planet'
  end

  step "I fill in the new planet form with:" do |table|
    table.hashes.each do |hash|
      fill_in hash['key'], with: hash['value']
    end

    click_button "Create Planet"
  end

  step "I view the page with organisms scoped by planet" do
    visit planet_organisms_path @planet
  end

  step "I should be on the planet show page for the planet :planet_name" do |planet_name|
    current_path.should == planet_path(planet_name.parameterize)
  end
end