Given "I have a small empty planet" do
  @planet = Toroid::Planet.new 3,3
end

Given "I have a small planet" do
  @planet = Toroid::Planet.new 3,3
  @planet[1,1] = Toroid::Organism.new
  @planet[2,2] = Toroid::Organism.new
end

When "I render the planet" do
  @renderer = Toroid::PlanetRenderer.new @planet
end

Then "I should see:" do |output|
  @renderer.render.should == parse_planet_description(output)
end

def parse_planet_description output
  output.raw.map do |record|
    record[0]
  end.join("\n")
end
