module Toroid
  class PlanetPopulator

    def populate(number_organisms, planet)
      result = {}
      1.upto(number_organisms) do
        begin
          x,y = generate_random_coordinate(planet.width, planet.height)
        end while result.key?([x,y])
        result.merge!({ [x,y] => create_organism })
      end
      result
    end

    private

    def create_organism
      Toroid::Organism.new
    end

    def generate_random_coordinate(width, height)
      x = rand(width)  
      y = rand(height)  

      [x,y]
    end
  end
end
