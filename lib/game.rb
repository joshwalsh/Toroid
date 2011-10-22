require 'planet'
require 'planet_populator'

class Game
  attr_accessor :planet

  def initialize(x = 10, y = 10, population = 0)
    @planet = Planet.new x,y
    populate population
  end

  def run(years)
    @planet.age years
  end

  private 

  def populate(population)
    populator = PlanetPopulator.new @planet
    populator.populate population
  end

end
