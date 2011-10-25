Given "I have a small empty planet" do
  @planet = Tordoid::Planet.new 3,3
end

Given "I have a small planet" do
  @planet = Tordoid::Planet.new 3,3
  @planet[1,1] = 'x'
  @planet[2,2] = 'x'
end

When "I render the planet" do
  @renderer = Tordoid::PlanetRenderer.new @planet
end

Then "I should see:" do |output|
  @renderer.render.should == parse_planet_description(output)
end

def parse_planet_description output
  output.raw.map do |record|
    record[0]
  end.join("\n")
end
