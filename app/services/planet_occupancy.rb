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

  def select_random_adjacent_coordinate(x, y)
  end
end