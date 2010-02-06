class PlanetPopulator
  def initialize(planet)
    @planet = planet
  end

  def populate(number_organisms)
  end

  def generate_random_coordinate
    x = rand(@planet.width)  
    y = rand(@planet.height)  

    [x,y]
  end
end
