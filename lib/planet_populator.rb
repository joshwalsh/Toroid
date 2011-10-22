class PlanetPopulator
  def initialize(planet)
    @planet = planet
  end

  def populate(number_organisms)
    @planet.clear

    i = 0
    until i == number_organisms
      x,y = generate_random_coordinate

      if @planet[x,y].nil?
        @planet[x,y] = 'x'
        i += 1
      end
    end
  end

  def generate_random_coordinate
    x = rand(@planet.width)  
    y = rand(@planet.height)  

    [x,y]
  end

end
