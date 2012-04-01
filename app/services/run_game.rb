class RunGame
  def initialize(game)
    @game = game
  end

  def for_years(years)
    years.times { for_year }
  end

  def for_year
    @game.year += 1

    run_planets
  end

  private

  def run_planets(planets = nil)
    planets ||= @game.planets

    planets.each { |planet| run_planet(planet) }
  end

  def run_planet(planet)
    planet.organisms.each { |organism| run_organism(organism, planet) }
    age = CalculateAge.for_year(@game.year, planet)
  end

  def run_organism(organism, planet)
    occupancy = PlanetOccupancy.new planet

    x = organism.x
    y = organism.y
    point = Point.new(x,y)

    new_coordinate = occupancy.select_random_adjacent_coordinate(point)

    occupancy.move_organism(organism, new_coordinate)
  end
end