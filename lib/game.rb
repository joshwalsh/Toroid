require 'planet'

class Game
  attr_accessor :planet

  def initialize(x = 10, y = 10)
    @planet = Planet.new x,y
  end
end
