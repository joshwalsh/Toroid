module Toroid
  class Organism
    attr_accessor :planet
    
    def initialize(planet)
      @planet = planet
      @birthday = @planet.year
    end
    
    def age
      planet.year - @birthday
    end
    
    def render
      'x'
    end
  end
end