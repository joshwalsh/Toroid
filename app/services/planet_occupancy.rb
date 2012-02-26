class PlanetOccupancy
  def initialize(planet)
    @planet = planet
  end

  def place_organism(x, y, organism)
    organism.x = x
    organism.y = y
    organism.save

    @planet.organisms << organism
  end
end