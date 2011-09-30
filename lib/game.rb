require 'planet'

class Game
  attr_accessor :planet
  attr_reader :age

  def initialize(x = 10, y = 10)
    @planet = Planet.new x,y
  end

  def populate(population)
    populator = PlanetPopulator.new @planet
    populator.populate population
  end

  def run(days)
    @age = days.to_i
  end
end
