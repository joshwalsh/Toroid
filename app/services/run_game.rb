class RunGame
  def initialize(game)
    @game = game
  end

  def for_years(years)
    years.times { for_year }
  end

  def for_year
    @game.year += 1

    @game.log "TIME: Year #{@game.year}"

    run_planets
  end

  private

  def run_planets(planets = nil)
    planets ||= @game.planets

    planets.each { |planet| run_planet(planet) }
  end

  def run_planet(planet)
    planet.organisms.each { |organism| run_organism(organism, planet) }

    @game.log "PLANET: #{planet.name}: Age #{planet.age}"
  end

  def run_organism(organism, planet)
    occupancy = PlanetOccupancy.new planet

    x = organism.x
    y = organism.y
    new_coordinate = occupancy.select_random_adjacent_coordinate(x, y)

    occupancy.move_organism(organism, new_coordinate[0], new_coordinate[1])

    @game.log "PLANET: #{planet.name}, ORGANISM: #{organism.name}, moved from #{x}, #{y} to #{organism.x}, #{organism.y}"
  end
end