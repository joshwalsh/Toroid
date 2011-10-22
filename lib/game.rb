require 'planet'

class Game
  attr_accessor :planet

  def initialize(x = 10, y = 10)
    @planet = Planet.new x,y
  end

  def populate(population)
    populator = PlanetPopulator.new @planet
    populator.populate population
  end

  def run(years)
    @planet.age years
  end
end
