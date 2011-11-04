module Tordoid
  class Game
    attr_accessor :planet
    attr_accessor :cell_mover, :planet_populator

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

    # Treat these two method definitions as "convenience"
    # initializers to give you the two collaborators
    # you were instantiating inline. You can now inject
    # custom or stubbed versions of these instances in
    # your test code.
    def cell_mover
      @cell_mover ||= CellMover.new @planet
    end

    def planet_populator
      @planet_populator ||= PlanetPopulator.new
    end

    private 

    def populate(population)
      populated_cells = planet_populator.populate population, @planet

      populated_cells.each do |coordinate, organism|
        x = coordinate[0]
        y = coordinate[1]

        @planet[x,y] = organism
      end
    end

    def move_organisms
      @planet.occupied_cells.dup.map do |coordinate, organism|
        x = coordinate[0]
        y = coordinate[1]
        cell_mover.move_at_random(x, y)
      end
    end
  end
end
