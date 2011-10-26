module Tordoid
  class Game
    attr_accessor :planet

    def initialize(x = 10, y = 10, population = 0)
      @planet = Planet.new x,y
      populate population
    end

    def run(years)
      years.times do
        @planet.age
        move_organisms
      end
    end

    private 

    def populate(population)
      populator = PlanetPopulator.new
      populated_cells = populator.populate population, @planet

      populated_cells.each do |coordinate, organism|
        x = coordinate[0]
        y = coordinate[1]

        @planet[x,y] = organism
      end
    end

    def move_organisms
    end
  end
end
