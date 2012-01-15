class Toroid::PlanetStats
  def initialize(planet)
    @planet = planet
  end

  def population
    @planet.occupied_cells.count
  end
end

