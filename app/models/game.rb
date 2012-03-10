class Game
  attr_accessor :year
  attr_accessor :planets
  attr_accessor :logs

  def initialize
    @planets = []
    @year = 1
    @logs = []
  end

  def log(activity)
    @logs << activity
  end

  def self.current
    current_game = PersistState.load

    if not current_game.instance_of? Game
      current_game = new 
    end

    current_game
  end

  def find_planet(name)
    @planets.each do |planet|
      return planet if planet.to_param == name
    end
  end
end