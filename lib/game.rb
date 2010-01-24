require 'planet'

class Game
  attr_accessor :planet

  def initialize
    @planet = Planet.new
  end
end
