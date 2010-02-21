class PlanetPopulator
  def initialize(planet)
    @planet = planet
  end

  def populate(number_organisms)
    i = 0
    until i == number_organisms
      x,y = generate_random_coordinate
      @planet[x,y] = 'x' if @planet[x,y].nil?

      i += 1
    end
  end

  def generate_random_coordinate
    x = rand(@planet.width)  
    y = rand(@planet.height)  

    [x,y]
  end
end
