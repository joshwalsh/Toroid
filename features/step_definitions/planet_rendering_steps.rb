require 'planet_renderer'
require 'planet'

Given "I have a small planet" do
  @planet = Planet.new 3,3
end

When "I render the planet" do
  @renderer = PlanetRenderer.new @planet
end

Then "I should see:" do |output|
  @renderer.render.should == parse_planet_description(output)
end

def parse_planet_description output
  output.raw.map do |record|
    record[0]
  end.join("\n")
end